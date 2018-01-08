defmodule Agala.Provider.Telegram.Model.MaskPosition do
  @moduledoc """
  This object represents an animation file to be displayed in the message containing a game.

  [https://core.telegram.org/bots/api#maskposition](https://core.telegram.org/bots/api#maskposition)
  """
  use Construct

  structure do
    field :point, :string
    field :x_shift, :float
    field :y_shift, :float
    field :scale, :float
  end
end
