defmodule Agala.Provider.Telegram.Poller do
  @moduledoc """

  ### How poller works?

  Poller gets all needed options in `start_link/1` argument. In these options `:chain`
  is specified.

  So the Poller make periodical work:

  1. HTTP get new updates from Telegram server
  2. Split this array into separate event
  3. Handle particular each event with chain
  4. Restart cycle again
  """
  use Agala.Bot.Common.Poller

  #######################################################################################
  ### Initialize section
  #######################################################################################

  @spec bootstrap(Agala.BotParams.t()) :: {:ok, Agala.BotParams}
  def bootstrap(bot_params) do
    {:ok,
     Map.put(bot_params, :private, %{
       http_opts:
         (get_in(bot_params, [:provider_params, :hackney_opts]) || [])
         |> Keyword.put(:recv_timeout, get_in(bot_params, [:provider_params, :poll_timeout]) || 5000),
       offset: 0,
       timeout: get_in(bot_params, [:provider_params, :poll_timeout])
     })}
  end

  #######################################################################################
  ### Get updates section
  #######################################################################################

  defp get_updates_url(%{provider_params: %{token: token}}) do
    "https://api.telegram.org/bot" <> token <> "/getUpdates"
  end

  defp get_updates_body(%{private: %{offset: offset, timeout: timeout}}) do
    %{offset: offset, timeout: timeout} |> Jason.encode!()
  end

  defp get_updates_options(%{private: %{http_opts: http_opts}}), do: http_opts

  defp parse_body({:ok, resp = %HTTPoison.Response{body: body}}) do
    {:ok, %HTTPoison.Response{resp | body: Jason.decode!(body)}}
  end

  defp parse_body(default), do: default

  @spec get_updates(bot_params :: Agala.BotParams.t) :: {list(), Agala.BotParams.t()}
  def get_updates(bot_params) do
    HTTPoison.post(
      # url
      get_updates_url(bot_params),
      # body
      get_updates_body(bot_params),
      # headers
      [{"Content-Type", "application/json"}],
      # opts
      get_updates_options(bot_params)
    )
    |> parse_body()
    |> resolve_updates(bot_params)
  end

  # Empty array of new messages
  defp resolve_updates(
         {:ok, %HTTPoison.Response{status_code: 200, body: %{"ok" => true, "result" => []}}},
         bot_params
       ) do
    {[], bot_params}
  end

  # This is just failed long polling, simply restart
  defp resolve_updates({:error, %HTTPoison.Error{id: nil, reason: :timeout}}, bot_params) do
    Logger.debug("[Telegram] Long polling request ended with timeout, resend to poll")
    {[], bot_params}
  end

  # Good variant - acceptable results
  defp resolve_updates(
         {:ok, %HTTPoison.Response{status_code: 200, body: %{"ok" => true, "result" => result}}},
         bot_params
       ) do
    Logger.debug(fn -> "Response body is:\n #{inspect(result)}" end)

    result
    |> process_messages(bot_params)
  end

  # HTTP protocol error - resending LongPolling request
  defp resolve_updates({:ok, %HTTPoison.Response{status_code: status_code}}, bot_params) do
    Logger.warn("[Telegram] HTTP response ended with status code #{status_code}")
    {[], bot_params}
  end

  # HTTPoison error - resending LongPolling request
  defp resolve_updates({:error, err}, bot_params) do
    Logger.warn("#{inspect(err)}")
    {[], bot_params}
  end

  # Taking offset from last message
  @spec process_messages(messages :: list(), bot_params :: Agala.BotParams.t()) :: {list(), Agala.BotParams.t()}
  defp process_messages(messages, bot_params) do
    %{"update_id" => offset} = Enum.at(messages, -1)
    {messages, put_in(bot_params, [:private, :offset], offset + 1)}
  end
end
