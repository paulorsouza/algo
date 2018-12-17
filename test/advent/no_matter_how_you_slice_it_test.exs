defmodule Advent.NoMatterHowYouSliceItTest do
  use ExUnit.Case
  import Advent.Helper
  import Advent.NoMatterHowYouSliceIt

  doctest Advent.NoMatterHowYouSliceIt

  test "overlapped_inches/1" do
    result =
      file_to_list("test/advent/input_text/no_matter_how_you_slice_it.txt")
      |> Enum.map(&parse_claim/1)
      |> overlapped_inches

    IO.inspect(length(result))
  end

  test "non_overlapping_claim/1" do
    result =
      file_to_list("test/advent/input_text/no_matter_how_you_slice_it.txt")
      |> non_overlapping_claim

    IO.inspect(result)
  end
end
