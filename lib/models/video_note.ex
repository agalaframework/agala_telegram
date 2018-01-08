defmodule Agala.Provider.Telegram.Model.VideoNote do
  @moduledoc """
  This object represents a video file.

  [https://core.telegram.org/bots/api#video](https://core.telegram.org/bots/api#video)
  """
  alias Agala.Provider.Telegram.Model.{PhotoSize}
  use Construct

  structure do
    field :file_id, :string
    field :length, :integer
    field :duration, :integer
    field :thumb, PhotoSize, default: nil
    field :file_size, :integer, default: nil
  end
end
