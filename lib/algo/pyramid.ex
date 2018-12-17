defmodule Algo.Pyramid do
  @moduledoc """
  Write a function that accepts a positive number N.
  The function should console log a pyramid shape
  with N levels using the # character.  Make sure the
  pyramid has spaces on both the left *and* right hand sides
  """

  def draw(n) do
    draw(n, 0, '')
  end

  defp draw(n, row, _) when n == row, do: nil

  defp draw(n, row, level) when length(level) == 2 * n - 1 do
    IO.puts(level)
    draw(n, row + 1, '')
  end

  defp draw(n, row, level) do
    mid_point = trunc((2 * n - 1) / 2)
    level_size = length(level)

    add =
      if(mid_point - row <= level_size && mid_point + row >= level_size) do
        '#'
      else
        ' '
      end

    draw(n, row, level ++ add)
  end
end
