defmodule Agala.Provider.Telegram.Model.Location do
  @moduledoc """
  This object represents a Telegram user or bot.

  [https://core.telegram.org/bots/api#user](https://core.telegram.org/bots/api#user)
  """
  use Construct

  structure do
    field :longitude, :float
    field :latitude, :float
  end
end
