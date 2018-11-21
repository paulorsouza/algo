defmodule AlgoTest do
  use ExUnit.Case
  doctest Algo
  doctest Palindrome

  test "greets the world" do
    assert Algo.hello() == :world
  end
end
