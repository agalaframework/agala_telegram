defmodule AgalaTelegramTest do
  use ExUnit.Case
  doctest AgalaTelegram

  test "greets the world" do
    assert AgalaTelegram.hello() == :world
  end
end
