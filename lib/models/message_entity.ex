defmodule Agala.Provider.Telegram.Model.MessageEntity do
  @moduledoc """
  This object represents one special entity in a text message. For example, hashtags, usernames, URLs, etc.

  [https://core.telegram.org/bots/api#messageentity](https://core.telegram.org/bots/api#messageentity)
  """
  alias Agala.Provider.Telegram.Model.{User}
  use Construct

  structure do
    field :type, :string
    field :offset, :integer
    field :length, :integer
    field :url, :string, default: nil
    field :user, User, default: nil
  end
end
