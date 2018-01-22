defmodule Agala.Provider.Telegram.Helpers do
  alias Agala.Provider.Telegram.Conn.Response
  @base_url "https://api.telegram.org/bot"

  defp base_url(route) do
    fn token -> @base_url <> token <> route end
  end

  defp create_body(map, opts) do
    Map.merge(map, Enum.into(opts, %{}), fn _, v1, _ -> v1 end)
  end

  @spec send_message(conn :: Agala.Conn.t, message :: String.t, opts :: Enum.t) :: Agala.Conn.t
  def send_message(conn, chat_id, message, opts \\ []) do
    Map.put(conn, :response, %Response{
      method: :post,
      payload: %{
        url: base_url("/sendMessage"),
        body: create_body(%{chat_id: chat_id, text: message}, opts),
        headers: [{"Content-Type", "application/json"}]
      }
    })
  end

  @spec delete_message(conn :: Agala.Conn.t, chat_id :: String.t | integer, message_id :: String.t | integer) :: Agala.Conn.t
  def delete_message(conn, chat_id, message_id) do
    Map.put(conn, :response, %Response{
      method: :post,
      payload: %{
        url: base_url("/deleteMessage"),
        body: create_body(%{chat_id: chat_id, message_id: message_id}, []),
        headers: [{"Content-Type", "application/json"}]
      }
    })
  end
  def kick_chat_member(conn, chat_id, user_id, opts \\ []) do
    Map.put(conn, :response, %Response{
      method: :post,
      payload: %{
        url: base_url("/kickChatMember"),
        body: create_body(%{chat_id: chat_id, user_id: user_id}, opts),
        headers: [{"Content-Type", "application/json"}]
      }
    })
  end
end
