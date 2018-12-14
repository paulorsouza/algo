defmodule Algo.FizzBuzz do
  @moduledoc """
  Write a program that console logs the numbers
  from 1 to n. But for multiples of three print
  fizz instead of the number and for the multiples
  of five print “buzz”. For numbers which are multiples
  of both three and five print “fizzbuzz”.
  """

  @doc """
  FizzBuzz

  ## Examples

      iex> import Algo.FizzBuzz
      iex> fizzbuzz(3)
      [1,2,"fizz"]
  """
  def fizzbuzz(count) do
    1..count
    |> Enum.map(&fizzbuzz?/1)
  end

  defp fizzbuzz?(num) when rem(num, 15) == 0, do: "fizzbuzz"
  defp fizzbuzz?(num) when rem(num, 3) == 0, do: "fizz"
  defp fizzbuzz?(num) when rem(num, 5) == 0, do: "buzz"
  defp fizzbuzz?(num), do: num
end
