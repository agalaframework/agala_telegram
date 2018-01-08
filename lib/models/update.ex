defmodule Agala.Provider.Telegram.Model.Update do
  @moduledoc """
  This object represents a Telegram user or bot.

  [https://core.telegram.org/bots/api#user](https://core.telegram.org/bots/api#user)
  """
  alias Agala.Provider.Telegram.Model.{Message, InlineQuery, ChosenInlineResult}
  alias Agala.Provider.Telegram.Model.{CallbackQuery, ShippingQuery, PreCheckoutQuery}
  use Construct

  structure do
    field :update_id, :integer
    field :message, Message, default: nil
    field :edited_message, Message, default: nil
    field :channel_post, Message, default: nil
    field :edited_channel_post, Message, default: nil
    field :inline_query, InlineQuery, default: nil
    field :chosen_inline_result, ChosenInlineResult, default: nil
    field :callback_query, CallbackQuery, default: nil
    # field :shipping_query, ShippingQuery, default: nil
    # field :pre_checkout_query, PreCheckoutQuery, default: nil
  end
end
