defmodule Agala.Provider.Telegram.Model.Game do
  @moduledoc """
  This object represents a game. Use BotFather to create and edit games, their short names will act as unique identifiers.

  [https://core.telegram.org/bots/api#game](https://core.telegram.org/bots/api#game)
  """
  alias Agala.Provider.Telegram.Model.{PhotoSize, MessageEntity, Animation}
  use Construct

  structure do
    field :file, :string
    field :description, :string
    field :photo, {:array, PhotoSize}
    field :text, :string
    field :text_entities, {:array, MessageEntity}, default: nil
    field :animation, Animation, default: nil
  end
end
