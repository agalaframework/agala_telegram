defmodule Agala.Provider.Telegram do
  use Agala.Provider
  @moduledoc """
  Module providing adapter for Telegram
  """

  defmacro __using__(:handler) do
    quote location: :keep do
      import Agala.Provider.Telegram.Helpers
    end
  end
end
