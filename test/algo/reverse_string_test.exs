defmodule Algo.ReverseStringTest do
  use ExUnit.Case
  import Algo.ReverseString

  doctest Algo.ReverseString

  test "Reverse reverses a string" do
    assert "dcba" == reverse1("abcd")
  end
end
