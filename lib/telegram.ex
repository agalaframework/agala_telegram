defmodule Agala.Provider.Telegram do
  use Agala.Provider
  @moduledoc """
  Module providing adapter for Telegram
  """
  def base_url(conn) do
    "https://api.telegram.org/bot" <> conn.provider_params.token
  end

  def init(bot_params, module) do
    {
      :ok,
      Map.put(bot_params, :private, %{
      http_opts: bot_params.provider_params.hackney_opts
                 |> set_timeout(bot_params, module),
      offset: 0,
      timeout: get_in(bot_params, [:provider_params, :poll_timeout])
    })}
  end
  defp set_timeout(http_opts, bot_params, module) do
    source = case module do
      :receiver -> :poll_timeout
      :responser -> :response_timeout
    end
    http_opts
    |> Keyword.put(:recv_timeout, get_in(bot_params, [:provider_params, source]) || 5000)
  end

  defmacro __using__(:handler) do
    quote location: :keep do
      import Agala.Provider.Telegram.Helpers
    end
  end
end
