defmodule Advent.StarAlignTest do
  use ExUnit.Case

  import Advent.Helper
  import Advent.StarAlign

  @moduletag :advent

  test "parse/1" do
    result =
      "position=< -9951, -50547> velocity=< 1,  5>"
      |> parse()

    assert result == %{position: %{x: -9951, y: -50547}, velocity: %{x: 1, y: 5}}
  end

  test "get_cordinates/1" do
    result =
      file_to_list("test/advent/input_text/star_align.txt")
      |> get_cordinates()

    assert length(result) == 343
  end

  test "move_stars/1" do
    ["position=< -9951, -50547> velocity=< 1,  5>", "position=< 10, -20> velocity=<-10,  22>"]
    |> get_cordinates()
    |> move_stars
  end

  test "align/1" do
    result =
      [
        "position=< 9,  1> velocity=< 0,  2>",
        "position=< 7,  0> velocity=<-1,  0>",
        "position=< 3, -2> velocity=<-1,  1>",
        "position=< 6, 10> velocity=<-2, -1>",
        "position=< 2, -4> velocity=< 2,  2>",
        "position=<-6, 10> velocity=< 2, -2>",
        "position=< 1,  8> velocity=< 1, -1>",
        "position=< 1,  7> velocity=< 1,  0>",
        "position=<-3, 11> velocity=< 1, -2>",
        "position=< 7,  6> velocity=<-1, -1>",
        "position=<-2,  3> velocity=< 1,  0>",
        "position=<-4,  3> velocity=< 2,  0>",
        "position=<10, -3> velocity=<-1,  1>",
        "position=< 5, 11> velocity=< 1, -2>",
        "position=< 4,  7> velocity=< 0, -1>",
        "position=< 8, -2> velocity=< 0,  1>",
        "position=<15,  0> velocity=<-2,  0>",
        "position=< 1,  6> velocity=< 1,  0>",
        "position=< 8,  9> velocity=< 0, -1>",
        "position=< 3,  3> velocity=<-1,  1>",
        "position=< 0,  5> velocity=< 0, -1>",
        "position=<-2,  2> velocity=< 2,  0>",
        "position=< 5, -2> velocity=< 1,  2>",
        "position=< 1,  4> velocity=< 2,  1>",
        "position=<-2,  7> velocity=< 2, -2>",
        "position=< 3,  6> velocity=<-1, -1>",
        "position=< 5,  0> velocity=< 1,  0>",
        "position=<-6,  0> velocity=< 2,  0>",
        "position=< 5,  9> velocity=< 1, -2>",
        "position=<14,  7> velocity=<-2,  0>",
        "position=<-3,  6> velocity=< 2, -1>"
      ]
      |> align()

    IO.puts(result)
  end

  test "puzzle awnser/1" do
    result =
      file_to_list("test/advent/input_text/star_align.txt")
      |> get_cordinates
      |> wait_for_message(nil)
      |> view_sky

    IO.puts(result)

    ###### ..#....#....##....######..#####...######..#....#..#####.
    # .......#....#...#..#........#..#....#.......#..#....#..#....#
    # .......#....#..#....#.......#..#....#.......#..#....#..#....#
    # .......#....#..#....#......#...#....#......#...#....#..#....#
    ##### ...######..#....#.....#....#####......#....######..#####.
    # .......#....#..######....#.....#.........#.....#....#..#.....
    # .......#....#..#....#...#......#........#......#....#..#.....
    # .......#....#..#....#..#.......#.......#.......#....#..#.....
    # .......#....#..#....#..#.......#.......#.......#....#..#.....
    ###### ..#....#..#....#..######..#.......######..#....#..#.....
  end

  test "count/1" do
    result =
      file_to_list("test/advent/input_text/star_align.txt")
      |> get_cordinates
      |> count(nil, 0)

    IO.puts(result)
  end
end
