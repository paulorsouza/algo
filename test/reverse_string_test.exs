defmodule ReverseStringTest do
  use ExUnit.Case
  doctest ReverseString

  test "Reverse reverses a string" do
    assert "dcba" == ReverseString.reverse1("abcd")
  end
end
