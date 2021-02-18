defmodule IntralanguageSourceTest do
  use ExUnit.Case
  doctest IntralanguageSource

  test "greets the world" do
    assert IntralanguageSource.hello() == :world
  end
end
