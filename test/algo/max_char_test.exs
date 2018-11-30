defmodule Algo.MaxCharTest do
  use ExUnit.Case
  import Algo.MaxChar

  doctest Algo.MaxChar

  test "Finds the most frequently used char" do
    assert max_char("a") == "a"
    assert max_char("absfdsafadaasfasaaaaaaaa") == "a"
  end

  test "Works with numbers in the string" do
    assert max_char("ab1111cd1112111d") == "1"
  end

end
