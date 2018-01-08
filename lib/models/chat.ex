defmodule Agala.Provider.Telegram.Model.Chat do
  @moduledoc """
  This object represents a chat.

  [https://core.telegram.org/bots/api#chat](https://core.telegram.org/bots/api#chat)
  """
  alias Agala.Provider.Telegram.Model.{ChatPhoto, Message}
  use Construct

  structure do
    field :id, :integer
    field :type, :string
    field :title, :string, default: nil
    field :username, :string, default: nil
    field :first_name, :string, default: nil
    field :last_name, :string, default: nil
    field :all_members_are_administrators, :boolean, default: nil
    field :photo, ChatPhoto, default: nil
    field :description, :string, default: nil
    field :invite_link, :string, default: nil
    field :pinned_message, Message, default: nil
    field :sticker_set_name, :string, default: nil
    field :can_set_sticker_set, :boolean, default: nil
  end
end
