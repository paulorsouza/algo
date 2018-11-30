defmodule Algo.Palindrome do
  @moduledoc """
  Given a string, return true if the string is a palindrome
  or false if it is not.  Palindromes are strings that
  form the same word if it is reversed. *Do* include spaces
  and punctuation in determining if the string is a palindrome.
  """

  @doc """
  Palindrome

  ## Examples

      iex> import Algo.Palindrome
      iex> palindrome?("aba")
      true
  """
  def palindrome?(str) do
    str == String.reverse(str)
  end

  @doc """
  Palindrome2

  ## Examples

      iex> import Algo.Palindrome
      iex> palindrome2?("aba")
      true
  """
  def palindrome2?(str) do
    str = String.graphemes(str) |> Enum.with_index(1)
    compare = fn {char, index} ->
      {compare_char, _} = Enum.at(str, Enum.count(str) - index)
      compare_char == char
    end
    str |> Enum.all?(&compare.(&1))
  end
end
