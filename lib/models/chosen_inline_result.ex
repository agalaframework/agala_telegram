defmodule Agala.Provider.Telegram.Model.ChosenInlineResult do
  @moduledoc """
  This object represents an animation file to be displayed in the message containing a game.

  [https://core.telegram.org/bots/api#choseninlineresult](https://core.telegram.org/bots/api#choseninlineresult)
  """
  alias Agala.Provider.Telegram.Model.{User, Location}
  use Construct

  structure do
    field :result_id, :string
    field :from, User
    field :location, Location, default: nil
    field :inline_message_id, :string, default: nil
    field :query, :string
  end
end
