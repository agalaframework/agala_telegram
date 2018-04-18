defmodule Agala.Provider.Telegram.Helpers do
  alias Agala.Provider.Telegram.Conn.Response

  defp base_url(%Agala.Provider.Telegram.Conn.ProviderParams{} = params) do
    "https://" <> params.host <> params.token
  end

  defp base_url(route, _conn) do
    fn params ->
      "https://" <> params.host <> "/bot" <> params.token <> route
    end
  end

  defp create_body(map, opts) when is_map(map) do
    Map.merge(map, Enum.into(opts, %{}), fn _, v1, _ -> v1 end)
  end

  defp create_body_multipart(map, opts) when is_map(map) do
    multipart =
      create_body(map, opts)
      |> Enum.map(fn
        {key, {:file, file}} -> {:file, file, {"form-data", [{:name, key}, {:filename, Path.basename(file)}]}, []}
        {key, value} -> {to_string(key), to_string(value)}
      end)
    {:multipart, multipart}
  end

  @spec send_message(conn :: Agala.Conn.t, message :: String.t, opts :: Enum.t) :: Agala.Conn.t
  def send_message(conn, chat_id, message, opts \\ []) do
    Map.put(conn, :response, %Response{
      method: :post,
      payload: %{
        url: base_url("/sendMessage", conn),
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
        url: base_url("/deleteMessage", conn),
        body: create_body(%{chat_id: chat_id, message_id: message_id}, []),
        headers: [{"Content-Type", "application/json"}]
      }
    })
  end

  @spec send_chat_action(conn :: Agala.Conn.t, chat_id :: String.t | integer, action :: String.t) :: Agala.Conn.t
  def send_chat_action(conn, chat_id, action) do
    Map.put(conn, :response, %Response{
      method: :post,
      payload: %{
        url: base_url("/sendChatAction", conn),
        body: create_body(%{chat_id: chat_id, action: action}, []),
        headers: [{"Content-Type", "application/json"}]
      }
    })
  end

  def kick_chat_member(conn, chat_id, user_id, opts \\ []) do
    Map.put(conn, :response, %Response{
      method: :post,
      payload: %{
        url: base_url("/kickChatMember", conn),
        body: create_body(%{chat_id: chat_id, user_id: user_id}, opts),
        headers: [{"Content-Type", "application/json"}]
      }
    })
  end

  @spec send_photo(conn :: Agala.Conn.t, chat_id :: String.t | integer, photo :: {:file, String.t}) :: Agala.Conn.t
  def send_photo(conn, chat_id, {:file, photo}, opts \\ []) do
    Map.put(conn, :response, %Response{
      method: :post,
      payload: %{
        url: base_url("/sendPhoto", conn),
        body: create_body_multipart(%{chat_id: chat_id, photo: {:file, photo}}, opts)
      }
    })
  end

  @spec send_document(conn :: Agala.Conn.t, chat_id :: String.t | integer, document :: {:file, String.t}) :: Agala.Conn.t
  def send_document(conn, chat_id, {:file, document}, opts \\ []) do
    Map.put(conn, :response, %Response{
      method: :post,
      payload: %{
        url: base_url("/sendDocument", conn),
        body: create_body_multipart(%{chat_id: chat_id, document: {:file, document}}, opts)
      }
    })
  end

  @spec get_file(conn :: Agala.Conn.t, file_id :: String.t) :: Agala.Conn.t
  def get_file(conn, file_id) do
    Map.put(conn, :response, %Response{
      method: :get,
      payload: %{
        url: base_url("/getFile", conn),
        body: create_body(%{file_id: file_id}, []),
        headers: [{"Content-Type", "application/json"}]
      }
    })
  end
end
