defmodule Agala.Provider.Telegram.Model.Sticker do
  @moduledoc """
  This object represents an animation file to be displayed in the message containing a game.

  [https://core.telegram.org/bots/api#animation](https://core.telegram.org/bots/api#animation)
  """
  alias Agala.Provider.Telegram.Model.{PhotoSize, MaskPosition}
  use Construct

  structure do
    field :file_id, :string
    field :width, :integer
    field :height, :integer
    field :thumb, PhotoSize, default: nil
    field :emoji, :string, default: nil
    field :set_name, :string, default: nil
    field :mask_position, MaskPosition, default: nil
    field :file_size, :integer, default: nil
  end
end
