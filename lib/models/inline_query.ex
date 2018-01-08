defmodule Agala.Provider.Telegram.Model.InlineQuery do
  @moduledoc """
  This object represents an animation file to be displayed in the message containing a game.

  [https://core.telegram.org/bots/api#inlinequery](https://core.telegram.org/bots/api#inlinequery)
  """
  alias Agala.Provider.Telegram.Model.{User, Location}
  use Construct

  structure do
    field :id, :string
    field :from, User
    field :location, Location, default: nil
    field :query, :string
    field :offset, :string
  end
end
