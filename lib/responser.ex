defmodule Agala.Provider.Telegram.Responser do
  use Agala.Bot.Responser

  defp create_body(%Agala.Conn{response: %{payload: %{body: body}}}) when is_bitstring(body), do: body
  defp create_body(%Agala.Conn{response: %{payload: %{body: body}}}) when is_map(body), do: body |> Poison.encode!
  defp create_body(_), do: ""

  defp create_url(%Agala.Conn{response: %{payload: %{url: url}}}, bot_params) when is_function(url) do
    url.(bot_params.provider_params.token)
  end

  @doc """
  Main entry point method. Process the response
  """
  def response(conn, bot_params) do
    case HTTPoison.request(
      conn.response.method,
      create_url(conn, bot_params),
      create_body(conn),
      Map.get(conn.response.payload, :headers, []),
      Map.get(conn.response.payload, :http_opts) || Map.get(bot_params.private, :http_opts) || []
    ) do
      {:ok, %HTTPoison.Response{body: body}} -> body |> Poison.decode!
      another -> another
    end
  end
end
