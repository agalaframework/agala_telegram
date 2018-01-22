defmodule Agala.Provider.Telegram.Receiver do
  @moduledoc """
  Main worker module
  """
  use Agala.Bot.Receiver
  alias Agala.BotParams

  defp get_updates_url(%BotParams{provider_params: %{token: token}}) do
    "https://api.telegram.org/bot" <> token <> "/getUpdates"
  end

  defp get_updates_body(%BotParams{private: %{offset: offset, timeout: timeout}}) do
    %{offset: offset, timeout: timeout} |> Poison.encode!
  end

  defp get_updates_options(%BotParams{private: %{http_opts: http_opts}}), do: http_opts

  def get_updates(notify_with, bot_params = %BotParams{}) do
    HTTPoison.post(
      get_updates_url(bot_params),            # url
      get_updates_body(bot_params),           # body
      [{"Content-Type", "application/json"}], # headers
      get_updates_options(bot_params)         # opts
    )
    |> parse_body()
    |> resolve_updates(notify_with, bot_params)
  end

  # Empty array of new messages
  defp resolve_updates(
    {
      :ok,
      %HTTPoison.Response{
        status_code: 200,
        body: %{"ok" => true, "result" => []}
      }
    },
    _,
    bot_params
  ), do: bot_params

  # This is just failed long polling, simply restart
  defp resolve_updates(
    {
      :error,
      %HTTPoison.Error{
        id: nil,
        reason: :timeout
      }
    },
    _,
    bot_params
  ) do
    Logger.debug("Long polling request ended with timeout, resend to poll")
    bot_params
  end

  # Good variant - acceptable results
  defp resolve_updates(
    {
      :ok,
      %HTTPoison.Response{
        status_code: 200,
        body: %{"ok" => true, "result" => result}
      }
    },
    notify_with,
    bot_params
  ) do
    Logger.debug fn -> "Response body is:\n #{inspect(result)}" end
    result
    |> process_messages(notify_with, bot_params)
  end
  # HTTP protocol error - resending LongPolling request
  defp resolve_updates({:ok, %HTTPoison.Response{status_code: status_code}}, _, bot_params) do
    Logger.warn("HTTP response ended with status code #{status_code}")
    bot_params
  end
  # HTTPoison error - resending LongPolling request
  defp resolve_updates({:error, err}, _, bot_params) do
    Logger.warn("#{inspect err}")
    bot_params
  end

  defp parse_body({:ok, resp = %HTTPoison.Response{body: body}}) do
    {:ok, %HTTPoison.Response{resp | body: Poison.decode!(body)}}
  end
  defp parse_body(default), do: default

  # Last message - updating offset with this message offset + 1
  defp process_messages([message] = [%{"update_id"=>offset}], notify_with, bot_params) do
    notify_with.(message)
    put_in(bot_params, [:private, :offset], offset + 1)
  end
  # Not last messages - simply passing to notify_with function
  defp process_messages([h|t], notify_with, bot_params) do
    notify_with.(h)
    process_messages(t, notify_with, bot_params)
  end
end
