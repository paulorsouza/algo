defmodule Algo.PyramidTest do
  use ExUnit.Case
  import Algo.Pyramid
  import ExUnit.CaptureIO

  @moduletag :algo
  doctest Algo.Pyramid

  test "draw/1 prints a pryamid for 3 rows" do
    assert capture_io(fn ->
             draw(3)
           end) == "  #  \n ### \n#####\n"
  end

  test "draw/1 prints a pryamid for 5 rows" do
    assert capture_io(fn ->
             draw(5)
           end) == "    #    \n   ###   \n  #####  \n ####### \n#########\n"
  end
end
