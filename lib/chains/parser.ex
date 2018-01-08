defmodule Agala.Provider.Telegram.Chain.Parser do
  alias Agala.Provider.Telegram.Model.Update

  def init(_) do
    []
  end

  def call(conn = %Agala.Conn{
    request: request
  }, _opts) do
    conn
    |> Map.put(:request, Update.make!(request))
  end
end
