defmodule Agala.Provider.Telegram.Model.Document do
  @moduledoc """
  This object represents a general file (as opposed to photos, voice messages and audio files).

  [https://core.telegram.org/bots/api#document](https://core.telegram.org/bots/api#document)
  """
  alias Agala.Provider.Telegram.Model.{PhotoSize}
  use Construct

  structure do
    field :file_id, :string
    field :thumb, PhotoSize, default: nil
    field :file_name, :string, default: nil
    field :mime_type, :string, default: nil
    field :file_size, :integer, default: nil
  end
end
