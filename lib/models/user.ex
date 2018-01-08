defmodule Agala.Provider.Telegram.Model.User do
  @moduledoc """
  This object represents a Telegram user or bot.

  [https://core.telegram.org/bots/api#user](https://core.telegram.org/bots/api#user)
  """
  use Construct

  structure do
    field :id, :integer
    field :is_bot, :boolean
    field :first_name, :string
    field :last_name, :string, default: nil
    field :username, :string, default: nil
    field :language_code, :string, default: nil
  end
end
