defmodule Agala.Provider.Telegram.Model.Voice do
  @moduledoc """
  This object represents a voice note.

  [https://core.telegram.org/bots/api#voice](https://core.telegram.org/bots/api#voice)
  """

  use Construct

  structure do
    field :file_id, :string
    field :duration, :integer
    field :mime_type, :string, default: nil
    field :file_size, :integer, default: nil
  end
end
