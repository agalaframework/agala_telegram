defmodule Agala.Provider.Telegram.Model do
  @moduledoc """
  Types used in Telegram Bot API.

  ## Reference

  [https://core.telegram.org/bots/api#available-types](https://core.telegram.org/bots/api#available-types)
  """
  defmodule User do
    defstruct [
      :id,
      :is_bot,
      :first_name,
      :last_name,
      :username,
      :language_code
    ]
    @type t :: %User{
      id: integer,
      is_bot: boolean,
      first_name: String.t,
      last_name: String.t,
      username: String.t,
      language_code: String.t
    }
  end

  defmodule Chat do
    defstruct [
      :id,
      :type,
      :title,
      :username,
      :first_name,
      :last_name,
      :all_members_are_administrators,
      :photo,
      :description,
      :invite_link,
      :pinned_message,
      :sticker_set_name,
      :can_set_sticker_set
    ]
    @type t :: %Chat{
      id: integer,
      type: String.t,
      title: String.t,
      username: String.t,
      first_name: String.t,
      last_name: String.t,
      all_members_are_administrators: boolean,
      photo: ChatPhoto.t,
      description: String.t,
      invite_link: String.t,
      pinned_message: Message.t,
      sticker_set_name: String.t,
      can_set_sticker_set: boolean
    }
  end

  defmodule Message do
    defstruct [
      :message_id,
      :from,
      :date,
      :chat,
      :forward_from,
      :forward_from_chat,
      :forward_from_message_id,
      :forward_signature,
      :forward_date,
      :reply_to_message,
      :edit_date,
      :media_group_id,
      :author_signature,
      :text,
      :entities,
      :caption_entities,
      :audio,
      :document,
      :game,
      :photo,
      :sticker,
      :video,
      :voice,
      :video_note,
      :caption,
      :contact,
      :location,
      :venue,
      :new_chat_member,
      :left_chat_member,
      :new_chat_title,
      :new_chat_photo,
      :delete_chat_photo,
      :group_chat_created,
      :supergroup_chat_created,
      :channel_chat_created,
      :migrate_to_chat_id,
      :migrate_from_chat_id,
      :pinned_message,
      :invoice,
      :successful_payment
    ]

    @type t :: %Message{
      message_id: integer,
      from: User.t,
      date: integer,
      chat: Chat.t,
      forward_from: User.t,
      forward_from_chat: Chat.t,
      forward_from_message_id: Integer,
      forward_signature: String.t,
      forward_date: integer,
      reply_to_message: Message.t,
      edit_date: integer,
      media_group_id: String.t,
      author_signature: String.t,
      text: String,
      entities: [MessageEntity.t],
      caption_entities: [MessageEntity.t],
      audio: Audio.t,
      document: Document.t,
      game: Game.t,
      photo: [PhotoSize.t],
      sticker: Sticker.t,
      video: Video.t,
      voice: Voice.t,
      video_note: VideoNote.t,
      caption: String.t,
      contact: Contact.t,
      location: Location.t,
      venue: Venue.t,
      new_chat_member: [User.t],
      left_chat_member: User.t,
      new_chat_title: String.t,
      new_chat_photo: [PhotoSize.t],
      delete_chat_photo: true,
      group_chat_created: true,
      supergroup_chat_created: true,
      channel_chat_created: true,
      migrate_to_chat_id: true,
      migrate_from_chat_id: integer,
      pinned_message: Message.t,
      invoice: Invoice.t,
      successful_payment: SuccessfulPayment.t
    }
  end

  defmodule MessageEntity do
    defstruct [
      :type,
      :offset,
      :length,
      :url,
      :user
    ]
    @type t :: %MessageEntity{
      type: String.t,
      offset: integer,
      length: integer,
      url: String.t,
      user: User.t
    }
  end

  defmodule PhotoSize do
    defstruct [
      :file_id,
      :width,
      :height,
      :file_size
    ]
    @type t :: %PhotoSize{
      file_id: String.t,
      width: integer,
      height: integer,
      file_size: integer
    }
  end

  defmodule Audio do
    defstruct [
      :file_id,
      :duration,
      :performer,
      :title,
      :mime_type,
      :file_size
    ]
    @type t :: %Audio{
      file_id: String.t,
      duration: integer,
      performer: String.t,
      title: String.t,
      mime_type: String.t,
      file_size: integer
    }
  end

  defmodule Document do
    defstruct [
      :file_id,
      :thumb,
      :file_name,
      :mime_type,
      :file_size
    ]
    @type t :: %Document{
      file_id: String.t,
      thumb: PhotoSize.t,
      file_name: String.t,
      mime_type: String.t,
      file_size: integer
    }
  end

  defmodule Video do
    defstruct [
      :file_id,
      :width,
      :height,
      :duration,
      :thumb,
      :mime_type,
      :file_size
    ]
    @type t :: %Video{
      file_id: String.t,
      width: integer,
      height: integer,
      duration: integer,
      thumb: PhotoSize.t,
      mime_type: String.t,
      file_size: integer
    }
  end

  defmodule Voice do
    defstruct [
      :file_id,
      :duration,
      :mime_type,
      :file_size
    ]
    @type t :: %Voice{
      file_id: String.t,
      duration: integer,
      mime_type: String.t,
      file_size: integer
    }
  end

  defmodule VideoNote do
    defstruct [
      :file_id,
      :length,
      :duration,
      :thumb,
      :file_size
    ]
    @type t :: %VideoNote{
      file_id: String.t,
      length: integer,
      duration: integer,
      thumb: PhotoSize.t,
      file_size: integer
    }
  end

  defmodule Contact do
    defstruct [
      :phone_number,
      :first_name,
      :last_name,
      :user_id
    ]
    @type t :: %Contact{
      phone_number: String.t,
      first_name: String.t,
      last_name: String.t,
      user_id: integer
    }
  end

  defmodule Location do
    defstruct [
      :latitude,
      :longitude
    ]
    @type t :: %Location{
      latitude: float,
      longitude: float
    }
  end

  defmodule Venue do
    defstruct [
      :location,
      :title,
      :address,
      :foursquare_id
    ]
    @type t :: %Venue{
      location: Location.t,
      title: String.t,
      address: String.t,
      foursquare_id: String.t
    }
  end

  defmodule UserProfilePhotos do
    defstruct [
      :total_count,
      :photos
    ]
    @type t :: %UserProfilePhotos{
      total_count: integer,
      photos: [[PhotoSize.t]]
    }
  end

  defmodule File do
    defstruct [
      :file_id,
      :file_size,
      :file_path
    ]
    @type t :: %File{
      file_id: String.t,
      file_size: integer,
      file_path: String.t
    }
  end

  defmodule ReplyKeyboardMarkup do
    defstruct [
      :keyboard,
      :resize_keyboard,
      :one_time_keyboard,
      :selective
    ]
    @type t :: %ReplyKeyboardMarkup{
      keyboard: [[KeyboardButton.t]],
      resize_keyboard: boolean,
      one_time_keyboard: boolean,
      selective: boolean
    }
  end

  defmodule KeyboardButton do
    defstruct [
      :text,
      :request_contact,
      :request_location
    ]
    @type t :: %KeyboardButton{
      text: String.t,
      request_contact: boolean,
      request_location: boolean
    }
  end

  defmodule ReplyKeyboardRemove do
    defstruct [
      :remove_keyboard,
      :selective
    ]
    @type t :: %ReplyKeyboardRemove{
      remove_keyboard: true,
      selective: boolean
    }
  end

  defmodule InlineKeyboardMarkup do
    defstruct [
      :inline_keyboard
    ]
    @type t :: %InlineKeyboardMarkup{
      inline_keyboard: [[InlineKeyboardButton.t]]
    }
  end

  defmodule InlineKeyboardButton do
    defstruct [
      :text,
      :url,
      :callback_data,
      :switch_inline_query,
      :switch_inline_query_current_chat,
      :callback_game,
      :pay
    ]
    @type t :: %InlineKeyboardButton{
      text: String.t,
      url: String.t,
      callback_data: String.t,
      switch_inline_query: String.t,
      switch_inline_query_current_chat: String.t,
      callback_game: CallbackGame.t,
      pay: boolean
    }
  end

  defmodule CallbackQuery do
    defstruct [
      :id,
      :from,
      :message,
      :inline_message_id,
      :chat_instance,
      :data,
      :game_short_name
    ]
    @type t :: %CallbackQuery{
      id: String.t,
      from: User.t,
      message: Message.t,
      inline_message_id: String.t,
      chat_instance: String.t,
      data: String.t,
      game_short_name: String.t
    }
  end

  defmodule ForceReply do
    defstruct [
      :force_reply,
      :selective
    ]
    @type t :: %ForceReply{
      force_reply: true,
      selective: boolean
    }
  end

  defmodule ChatPhoto do
    defstruct [
      :small_file_id,
      :big_file_id
    ]
    @type t :: %ChatPhoto{
      small_file_id: String.t,
      big_file_id: String.t
    }
  end

  defmodule ChatMember do
    defstruct [
      :user,
      :status,
      :until_date,
      :can_be_edited,
      :can_change_info,
      :can_post_messages,
      :can_edit_messages,
      :can_delete_messages,
      :can_invite_users,
      :can_restrict_members,
      :can_pin_messages,
      :can_promote_members,
      :can_send_messages,
      :can_send_media_messages,
      :can_send_other_messages,
      :can_add_web_page_previews
    ]
    @type t :: %ChatMember{
      user: User.t,
      status: String.t,
      until_date: integer,
      can_be_edited: boolean,
      can_change_info: boolean,
      can_post_messages: boolean,
      can_edit_messages: boolean,
      can_delete_messages: boolean,
      can_invite_users: boolean,
      can_restrict_members: boolean,
      can_pin_messages: boolean,
      can_promote_members: boolean,
      can_send_messages: boolean,
      can_send_media_messages: boolean,
      can_send_other_messages: boolean,
      can_add_web_page_previews: boolean
    }
  end

  defmodule ResponseParameters do
    defstruct [
      :migrate_to_chat_id,
      :retry_after
    ]
    @type t :: %ResponseParameters{
      migrate_to_chat_id: integer,
      retry_after: integer
    }
  end

  defmodule InputMediaPhoto do
    defstruct [
      :type,
      :media,
      :caption
    ]
    @type t :: %InputMediaPhoto{
      type: String.t,
      media: String.t,
      caption: String.t
    }
  end

  defmodule InputMediaVideo do
    defstruct [
      :type,
      :media,
      :caption,
      :width,
      :height,
      :duration
    ]
    @type t :: %InputMediaVideo{
      type: String.t,
      media: String.t,
      caption: String.t,
      width: integer,
      height: integer,
      duration: integer
    }
  end

  defmodule Sticker do
    defstruct [
      :file_id,
      :width,
      :height,
      :thumb,
      :emoji,
      :set_name,
      :mask_position,
      :file_size
    ]
    @type t :: %Sticker{
      file_id: String.t,
      width: integer,
      height: integer,
      thumb: PhotoSize.t,
      emoji: String.t,
      set_name: String.t,
      mask_position: MaskPosition.t,
      file_size: integer
    }
  end

  defmodule StickerSet do
    defstruct [
      :name,
      :title,
      :contains_masks,
      :stickers
    ]
    @type t :: %StickerSet{
      name: String.t,
      title: String.t,
      contains_masks: boolean,
      stickers: [Sticker.t]
    }
  end

  defmodule MaskPosition do
    defstruct [
      :point,
      :x_shift,
      :y_shift,
      :scale
    ]
    @type t :: %MaskPosition{
      point: String.t,
      x_shift: float,
      y_shift: float,
      scale: float
    }
  end

  defmodule InlineQuery do
    defstruct [
      :id,
      :from,
      :location,
      :query,
      :offset
    ]
    @type t :: %InlineQuery{
      id: String.t,
      from: User.t,
      location: Location.t,
      query: String.t,
      offset: integer
    }
  end

  defmodule ChosenInlineResult do
    defstruct [
      :result_id,
      :from,
      :location,
      :inline_message_id,
      :query
    ]
    @type t :: %ChosenInlineResult{
      result_id: String.t,
      from: User.t,
      location: Location.t,
      inline_message_id: String.t,
      query: String.t
    }
  end

  ### --- Payments --- ###
  defmodule LabeledPrice do
    defstruct [
      :label,
      :amount
    ]
    @type t :: %LabeledPrice{
      label: String.t,
      amount: integer
    }
  end

  defmodule Invoice do
    defstruct [
      :title,
      :description,
      :start_parameter,
      :currency,
      :total_amount
    ]
    @type t :: %Invoice{
      title: String.t,
      description: String.t,
      start_parameter: String.t,
      currency: String.t,
      total_amount: integer
    }
  end

  defmodule ShippingAddress do
    defstruct [
      :country_code,
      :state,
      :city,
      :street_line1,
      :street_line2,
      :post_code
    ]
    @type t :: %ShippingAddress{
      country_code: String.t,
      state: String.t,
      city: String.t,
      street_line1: String.t,
      street_line2: String.t,
      post_code: String.t
    }
  end

  defmodule OrderInfo do
    defstruct [
      :name,
      :phone_number,
      :email,
      :shipping_address
    ]
    @type t :: %OrderInfo{
      name: String.t,
      phone_number: String.t,
      email: String.t,
      shipping_address: ShippingAddress.t
    }
  end

  defmodule ShippingOption do
    defstruct [
      :id,
      :title,
      :prices
    ]
    @type t :: %ShippingOption{
      id: String.t,
      title: String.t,
      prices: [LabeledPrice.t]
    }
  end

  defmodule SuccessfulPayment do
    defstruct [
      :currency,
      :total_amount,
      :invoice_payload,
      :shipping_option_id,
      :order_info,
      :telegram_payment_charge_id,
      :provider_payment_charge_id
    ]
    @type t :: %SuccessfulPayment{
      currency: String.t,
      total_amount: integer,
      invoice_payload: String.t,
      shipping_option_id: String.t,
      order_info: OrderInfo,
      telegram_payment_charge_id: String.t,
      provider_payment_charge_id: String.t
    }
  end

  defmodule ShippingQuery do
    defstruct [
      :id,
      :from,
      :invoice_payload,
      :shipping_address
    ]
    @type t :: %ShippingQuery{
      id: String.t,
      from: User.t,
      invoice_payload: String.t,
      shipping_address: ShippingAddress.t
    }
  end

  defmodule PreCheckoutQuery do
    defstruct [
      :id,
      :from,
      :currency,
      :total_amount,
      :invoice_payload,
      :shipping_option_id,
      :order_info
    ]
    @type t :: %PreCheckoutQuery{
      id: String.t,
      from: User.t,
      currency: String.t,
      total_amount: integer,
      invoice_payload: String.t,
      shipping_option_id: String.t,
      order_info: OrderInfo
    }
  end

  ### --- Top level type --- ###

  defmodule Update do
    defstruct [
      :update_id,
      :message,
      :edited_message,
      :channel_post,
      :edited_channel_post,
      :inline_query,
      :chosen_inline_result,
      :callback_query,
      :shipping_query,
      :pre_checkout_query
    ]
    @type t :: %Update{
      update_id: integer,
      message: Message.t,
      edited_message: Message.t,
      channel_post: Message.t,
      edited_channel_post: Message.t,
      inline_query: InlineQuery.t,
      chosen_inline_result: ChosenInlineResult.t,
      callback_query: CallbackQuery.t,
      shipping_query: ShippingQuery.t,
      pre_checkout_query: PreCheckoutQuery.t
    }
  end

  ### --- Error handling --- ###

  # defmodule Error do
  #   defexception :reason
  #   @type t :: %Error{reason: any}

  #   def message(%Error{reason: reason}), do: inspect(reason)
  # end
end
