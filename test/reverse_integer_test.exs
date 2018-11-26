defmodule ReverseIntegerTest do
  use ExUnit.Case
  import ReverseInteger

  doctest ReverseInteger

  test "Reverse reverses a string" do
    assert "dcba" == ReverseString.reverse1("abcd")
  end

  test "ReverseInt handles 0 as an input" do
    assert reverse_int(0) == 0
  end

  test "ReverseInt flips a positive number" do
    assert reverse_int(5) == 5
    assert reverse_int(15) == 51
    assert reverse_int(90) == 9
    assert reverse_int(2359) == 9532
  end

  test "ReverseInt flips a negative number" do
    assert reverse_int(-5) == -5
    assert reverse_int(-15) == -51
    assert reverse_int(-90) == -9
    assert reverse_int(-2359) == -9532
  end
end
