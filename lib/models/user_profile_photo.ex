defmodule Agala.Provider.Telegram.Model.UserProfilePhotos do
  @moduledoc """
  This object represents a video file.

  [https://core.telegram.org/bots/api#video](https://core.telegram.org/bots/api#video)
  """
  alias Agala.Provider.Telegram.Model.{PhotoSize}
  use Construct

  structure do
    field :total_count, :integer
    field :photos, {:array, {:array, PhotoSize}}
  end
end
