defmodule Agala.Provider.Telegram.Model.Audio do
  @moduledoc """
  This object represents an audio file to be treated as music by the Telegram clients.

  [https://core.telegram.org/bots/api#audio](https://core.telegram.org/bots/api#audio)
  """

  use Construct

  structure do
    field :file_id, :string
    field :duration, :integer
    field :performer, :string, default: nil
    field :title, :string, default: nil
    field :mime_type, :string, default: nil
    field :file_size, :integer, default: nil
  end
end
