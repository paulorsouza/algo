defmodule Algo.Steps do
  @moduledoc """
  Write a function that accepts a positive number N.
  The function should console log a step shape
  with N levels using the # character.  Make sure the
  step has spaces on the right hand side!
  """

  @doc """
  Print steps with fucntions
  """
  def print_steps(n) do
    print_steps(n, 1, "")
  end

  defp print_steps(n, row, _) when n < row, do: nil

  defp print_steps(n, row, line) do
    if(String.length(line) == n) do
      IO.puts(line)
      print_steps(n, row + 1, "")
    else
      if(String.length(line) >= row) do
        print_steps(n, row, line <> " ")
      else
        print_steps(n, row, line <> "#")
      end
    end
  end

  @doc """
  Print steps with comprehensions
  """
  def print_lines(steps) do
    rows = 1..steps
    columns = 1..steps

    for column <- columns, row <- rows do
      if row <= column do
        IO.write("#")
      else
        IO.write(" ")
      end

      if row == steps and column != steps, do: IO.puts("")
    end
  end
end
