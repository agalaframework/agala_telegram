defmodule Agala.Provider.Telegram.Model.Message do
  @moduledoc """
  This object represents a message.

  [https://core.telegram.org/bots/api#message](https://core.telegram.org/bots/api#message)
  """
  alias Agala.Provider.Telegram.Model.{User, Chat, Message, MessageEntity, Audio}
  alias Agala.Provider.Telegram.Model.{Document, Game, PhotoSize, Sticker, Video}
  alias Agala.Provider.Telegram.Model.{Voice, VideoNote, Contact, Location, Venue}
  alias Agala.Provider.Telegram.Model.{Invoice, SuccessfulPayment}
  use Construct

  structure do
    field :message_id, :integer
    field :from, User, default: nil
    field :date, :integer
    field :chat, Chat
    field :forward_from, User, default: nil
    field :forward_from_chat, Chat, default: nil
    field :forward_from_message_id, :integer, default: nil
    field :forward_signature, :string, default: nil
    field :forward_date, :integer, default: nil
    field :reply_to_message, Message, default: nil
    field :edit_date, :integer, default: nil
    field :media_group_id, :string, default: nil
    field :author_signature, :string, default: nil
    field :text, :string, default: nil
    field :entities, {:array, MessageEntity}, default: nil
    field :caption_entities, {:array, MessageEntity}, default: nil
    field :audio, Audio, default: nil
    field :document, Document, default: nil
    field :game, Game, default: nil
    field :photo, {:array, PhotoSize}, default: nil
    field :sticker, Sticker, default: nil
    field :video, Video, default: nil
    field :voice, Voice, default: nil
    field :video_note, VideoNote, default: nil
    field :caption, :string, default: nil
    field :contact, Contact, default: nil
    field :location, Location, default: nil
    field :venue, Venue, default: nil
    field :new_chat_members, {:array, User}, default: nil
    field :left_chat_member, User, default: nil
    field :new_chat_title, :string, default: nil
    field :new_chat_photo, {:array, PhotoSize}, default: nil
    field :delete_chat_photo, :boolean, default: nil
    field :group_chat_created, :boolean, default: nil
    field :supergroup_chat_created, :boolean, default: nil
    field :channel_chat_created, :boolean, default: nil
    field :migrate_to_chat_id, :integer, default: nil
    field :migrate_from_chat_id, :integer, default: nil
    field :pinned_message, Message, default: nil
    # field :invoice, Invoice, default: nil
    # field :successful_payment, SuccessfulPayment, default: nil
  end
end
