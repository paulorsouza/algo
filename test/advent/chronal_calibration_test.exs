defmodule Advent.ChronalCalibrationTest do
  use ExUnit.Case

  import Advent.Helper
  import Advent.ChronalCalibration

  @moduletag :advent

  test "final_frequency/1" do
    input = """
    +2
    +2
    -6
    +2
    """

    assert final_frequency(input) == 0
  end

  test "frequency/1" do
    input = """
    +2
    +2
    -6
    +2
    """

    assert frequency(input) == 0
  end

  test "sum_lines/2" do
    result =
      """
      +2
      +2
      -10
      +2
      """
      |> lines_to_list()
      |> sum_lines(0)

    assert result == -4
  end

  test "freq/1" do
    {:ok, io} =
      StringIO.open("""
      +2
      +2
      -10
      +2
      """)

    assert freq(IO.stream(io, :line)) == -4
    assert freq(File.stream!("test/advent/input_text/chronal_calibration.txt", [], :line)) == 578
  end

  @tag :slow
  test "repeated_frequency/1" do
    {:ok, io} =
      StringIO.open("""
      +2
      +2
      4
      -4
      """)

    assert repeated_frequency(IO.stream(io, :line)) == 4

    assert repeated_frequency(
             File.stream!("test/advent/input_text/chronal_calibration.txt", [], :line)
           ) == 82516
  end

  test "repeated_freq/1" do
    {:ok, io} =
      StringIO.open("""
      +2
      +2
      4
      -4
      """)

    assert repeated_freq(IO.stream(io, :line)) == 4

    assert repeated_freq(
             File.stream!("test/advent/input_text/chronal_calibration.txt", [], :line)
           ) == 82516
  end

  test "first_twice/1" do
    assert first_twice(File.stream!("test/advent/input_text/chronal_calibration.txt", [], :line)) ==
             82516
  end

  test "advent puzzle" do
    result =
      "test/advent/input_text/chronal_calibration.txt"
      |> file_to_list()
      |> sum_lines(0)

    # IO.inspect(result, label: "Chronal calibration answer")
    assert result == 578
  end
end
