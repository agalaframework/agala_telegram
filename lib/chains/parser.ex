defmodule Agala.Provider.Telegram.Chain.Parser do
  @moduledoc """
  This chain is used to parse incoming Telegram message into defined structs.
  You can use it if you are not afraid of loosing performance.

  Chain will raise an exception, if incoming message's structure does not match to predefined model
  structure inside `Agala.Telegram` provider.

  **NOTE:** If Telegram's API has been changed, but the `agala_telegram` library didn't -
  you parsers can fall with exception.
  """
  alias Agala.Provider.Telegram.Model.Update

  @doc """
  Function is used as a convention for `Agala.Chain` behaviour, but is not used in this provider.
  Options, passed to the function will be omitted.
  """
  @spec init(opts :: Keyword.t) :: Keyword.t
  def init(opts), do: opts

  @doc """
  Method takes JSON decoded incoming message from the `Agala.Conn` by `:request` key,
  parses it and puts back in `Agala.Conn` with `:request` key.
  """
  @spec call(conn :: Agala.Conn.t, opts :: Keyword.t) :: Agala.Conn.t
  def call(conn = %Agala.Conn{
    request: request
  }, _opts) do
    conn
    |> Map.put(:request, Update.make!(request))
  end
end
