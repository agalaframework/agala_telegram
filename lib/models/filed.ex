defmodule Agala.Provider.Telegram.Model.File do
  @moduledoc """
  This object represents a Telegram user or bot.

  [https://core.telegram.org/bots/api#user](https://core.telegram.org/bots/api#user)
  """
  use Construct

  structure do
    field :file_id, :string
    field :file_size, :integer, default: nil
    field :file_path, :string, default: nil
  end
end
