defmodule Agala.Provider.Telegram.Model.Animation do
  @moduledoc """
  This object represents an animation file to be displayed in the message containing a game.

  [https://core.telegram.org/bots/api#animation](https://core.telegram.org/bots/api#animation)
  """
  alias Agala.Provider.Telegram.Model.{PhotoSize}
  use Construct

  structure do
    field :filed_id, :string
    field :thumb, PhotoSize, default: nil
    field :file_name, :string, default: nil
    field :mime_type, :string, default: nil
    field :file_size, :integer, default: nil
  end
end
