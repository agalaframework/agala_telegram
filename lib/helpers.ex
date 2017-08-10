defmodule Agala.Provider.Telegram.Helpers do
  @base_url "https://api.telegram.org/bot"

  defp base_url(route) do
    fn token -> @base_url <> token <> route end
  end

  defp create_body(map, opts) do
    Map.merge(map, Enum.into(opts, %{}), fn _, v1, _ -> v1 end)
  end

  def send_message(conn, name, chat_id, message, opts \\ []) do
    Map.put(conn, :response, %Agala.Provider.Telegram.Conn.Response{
      method: :post,
      payload: %{
        url: base_url("/sendMessage"),
        body: create_body(%{chat_id: chat_id, text: message}, opts),
        headers: [{"Content-Type", "application/json"}]
      }
    })
    |> Map.put(:responser_name, name)
  end
end
