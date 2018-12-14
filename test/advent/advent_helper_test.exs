defmodule Advent.HelperTest do
  use ExUnit.Case
  import Advent.Helper

  @moduletag :advent

  test "convert lines into a list" do
    lines = """
    a
    b
    c
    d
    """

    assert lines_to_list(lines) == ["a", "b", "c", "d"]
  end

  test "convert lines with space into a list" do
    lines = """
    + ax
    - 12
    1 c 1
    + 1d
    """

    assert lines_to_list(lines) == ["+ ax", "- 12", "1 c 1", "+ 1d"]
  end

  test "convert text input to a list" do
    result =
      "test/advent/input_text/simple.txt"
      |> file_to_list()

    assert result == ["ax", "bx", "cx", "dx"]
  end
end
