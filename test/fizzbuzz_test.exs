defmodule FizzBuzzTest do
  use ExUnit.Case
  import FizzBuzz

  doctest FizzBuzz

  test "Calling fizzbuzz with '5' prints out 5 statements" do
    assert fizzbuzz(5) |> Enum.count() == 5
  end

  test "Calling fizzbuzz with 15 prints out the correct values" do
    list = fizzbuzz(15)
    assert Enum.at(list, 0) == 1
    assert Enum.at(list, 1) == 2
    assert Enum.at(list, 2) == "fizz"
    assert Enum.at(list, 3) == 4
    assert Enum.at(list, 4) == "buzz"
    assert Enum.at(list, 5) == "fizz"
    assert Enum.at(list, 6) == 7
    assert Enum.at(list, 7) == 8
    assert Enum.at(list, 8) == "fizz"
    assert Enum.at(list, 9) == "buzz"
    assert Enum.at(list, 10) == 11
    assert Enum.at(list, 11) == "fizz"
    assert Enum.at(list, 12) == 13
    assert Enum.at(list, 13) == 14
    assert Enum.at(list, 14) == "fizzbuzz"
  end
end
