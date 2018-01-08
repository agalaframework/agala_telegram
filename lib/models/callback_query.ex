defmodule Agala.Provider.Telegram.Model.CallbackQuery do
  @moduledoc """
  This object represents an animation file to be displayed in the message containing a game.

  [https://core.telegram.org/bots/api#inlinequery](https://core.telegram.org/bots/api#inlinequery)
  """
  alias Agala.Provider.Telegram.Model.{User, Message}
  use Construct

  structure do
    field :id, :string
    field :from, User
    field :message, Message, default: nil
    field :inline_message_id, :string, default: nil
    field :chat_instance, :string
    field :data, :string, default: nil
    field :game_short_name, :string, default: nil
  end
end
