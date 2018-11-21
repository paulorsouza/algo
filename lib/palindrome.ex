defmodule Palindrome do
  @moduledoc """
  Given a string, return true if the string is a palindrome
  or false if it is not.  Palindromes are strings that
  form the same word if it is reversed. *Do* include spaces
  and punctuation in determining if the string is a palindrome.
  """

  @doc """
  Palindrome

  ## Examples

    iex> Palindrome.palindrome?("aba")
    true
  """
  def palindrome?(str) do
    reversed = ReverseString.reverse1(str)
    str == reversed
  end
end
