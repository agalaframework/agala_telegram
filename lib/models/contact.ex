defmodule Agala.Provider.Telegram.Model.Contact do
  @moduledoc """
  This object represents a Telegram user or bot.

  [https://core.telegram.org/bots/api#user](https://core.telegram.org/bots/api#user)
  """
  use Construct

  structure do
    field :phone_number, :string
    field :first_name, :string
    field :last_name, :string, default: nil
    field :user_id, :integer, default: nil
  end
end
