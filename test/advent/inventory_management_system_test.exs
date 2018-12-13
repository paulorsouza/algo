defmodule Advent.InventoryManagementSystemTest do
  use ExUnit.Case

  import Advent.Helper
  import Advent.InventoryManagementSystem

  @moduletag :advent

  test "two_map/1" do
    result = "bababc"
    |> two_map()
    assert result[97] == 2
    assert result[98] == 3
  end

  test "count_chars/1" do
    result = "bababc"
    |> count_chars()
    assert result[97] == 2
    assert result[98] == 3
  end

  test "get_twice_and_thrice/1" do
    list = [
    "abcdef",
    "bababc",
    "abbcde",
    "abcccd",
    "aabcdd",
    "abcdee",
    "ababab"
    ]
    result = list
    |> Enum.map(&two_map/1)
    |> Enum.map(&get_twice_and_thrice/1)
    assert result == [{0, 0}, {1, 1}, {1, 0}, {0, 1}, {1, 0}, {1, 0}, {0, 1}]
  end

  test "comp/1" do
    list = [
    "abcdef",
    "bababc",
    "abbcde",
    "abcccd",
    "aabcdd",
    "abcdee",
    "ababab"
    ]
    result = list
    |> comp()

    assert result == 12
  end

  test "checksum/1" do
    result = "test/advent/input_text/inventory.txt"
    |> file_to_list()
    |> checksum()
    assert result == 8398
  end

  test "correct_box/1 real" do
    result = "test/advent/input_text/inventory.txt"
    |> file_to_list()
    |> correct_box()
    assert result == 'hhvsdkatysmiqjxunezgwcdpr'
  end

  test "correct_box/1" do
    list = [
      "abcde",
      "fghij",
      "klmno",
      "pqrst",
      "fguij",
      "axcye",
      "wvxyz"
    ]

    result = list
    |> correct_box()

    assert result == 'fgij'
  end
end
