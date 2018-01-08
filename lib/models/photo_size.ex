defmodule Agala.Provider.Telegram.Model.PhotoSize do
  @moduledoc """
  This object represents one size of a photo or a file / sticker thumbnail.

  [https://core.telegram.org/bots/api#photosize](https://core.telegram.org/bots/api#photosize)
  """
  use Construct

  structure do
    field :file_id, :string
    field :width, :integer
    field :height, :integer
    field :file_size, :integer, default: nil
  end
end
