defmodule Agala.Provider.Telegram.Conn.Response do
  defstruct [
    method: :noaction,
    payload: %{},
    opts: []
  ]

  @type t :: %Agala.Provider.Telegram.Conn.Response{
    method: :post | :get | :put | :delete,
    payload: %{},
    opts: Keyword.t
  }

  @behaviour Access
  @doc false
  def fetch(bot_params, key) do
    Map.fetch(bot_params, key)
  end

  @doc false
  def get(structure, key, default \\ nil) do
    Map.get(structure, key, default)
  end

  @doc false
  def get_and_update(term, key, list) do
    Map.get_and_update(term, key, list)
  end

  @doc false
  def pop(term, key) do
    {get(term, key), term}
  end
end
