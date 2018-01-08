defmodule Agala.Provider.Telegram.Model.Venue do
  @moduledoc """
  This object represents a video file.

  [https://core.telegram.org/bots/api#video](https://core.telegram.org/bots/api#video)
  """
  alias Agala.Provider.Telegram.Model.{Location}
  use Construct

  structure do
    field :location, Location
    field :title, :string
    field :address, :string
    field :foursquare_id, :string, default: nil
  end
end
