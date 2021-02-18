defmodule IntralanguageReceiverTest do
  use ExUnit.Case
  doctest IntralanguageReceiver

  test "greets the world" do
    assert IntralanguageReceiver.hello() == :world
  end
end
