defmodule Agala.Provider.Telegram.Conn.ProviderParams do
  defstruct [
    token: nil,
    poll_timeout: nil,
    response_timeout: nil,
  ]

  @type t :: %Agala.Provider.Telegram.Conn.ProviderParams{
    token: String.t,
    poll_timeout: integer | :infinity,
    response_timeout: integer | :infinity,
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
