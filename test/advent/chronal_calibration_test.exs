defmodule Advent.ChronalCalibrationTest do
  use ExUnit.Case

  import Advent.Helper
  import Advent.ChronalCalibration

  doctest Advent.ChronalCalibration

  test "with simple input" do
    input = ("""
    +2
    +2
    -6
    +2
    """)
    assert final_frequency(input) == 0
  end

  test "sum lines" do
    result = """
    +2
    +2
    -10
    +2
    """ |> lines_to_list()
    |> sum_lines(0)
    assert result == -4
  end

  test "advent puzzle" do
    result = "test/advent/input_text/chronal_calibration.txt"
    |> file_to_list()
    |> sum_lines(0)

    # IO.puts "Chronal calibration my puzzle answer -> "
    # IO.inspect result

    assert result == 578
  end

end
