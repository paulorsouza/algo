defmodule Algo.StepsTests do
  use ExUnit.Case
  import Algo.Steps
  import ExUnit.CaptureIO

  @moduletag :algo
  doctest Algo.Steps

  test "should output 5 lines with # progressively with print_steps" do
    assert assert capture_io(fn ->
      print_steps(5)
    end) == "#    \n##   \n###  \n#### \n#####\n"
  end

  test "should output 3 lines with # progressively with print_steps" do
    assert assert capture_io(fn ->
      print_steps(3)
    end) == "#  \n## \n###\n"
  end

  test "should output 5 lines with # progressively" do
    assert assert capture_io(fn ->
      print_lines(5)
    end) == "#    \n##   \n###  \n#### \n#####"
  end

  test "should output 3 lines with # progressively" do
    assert assert capture_io(fn ->
      print_lines(3)
    end) == "#  \n## \n###"
  end

end
