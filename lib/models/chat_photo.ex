defmodule Agala.Provider.Telegram.Model.ChatPhoto do
  @moduledoc """
  This object represents a chat photo.

  [https://core.telegram.org/bots/api#chatphoto](https://core.telegram.org/bots/api#chatphoto)
  """
  use Construct

  structure do
    field :small_file_id, :string
    field :big_file_id, :string
  end
end
