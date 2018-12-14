defmodule Algo.ReverseString do
  @moduledoc """
  Given a string, return a new string with the reversed
  order of characters
  """

  @doc """
  Reverse 1.

  ## Examples

      iex> import Algo.ReverseString
      iex> reverse1("abcd")
      "dcba"
      iex> reverse1("  abcd")
      "dcba  "
      iex> reverse1("ãáàéè")
      "èéàáã"
  """
  def reverse1(str) do
    String.reverse(str)
  end

  @doc """
  Reverse 2.

  ## Examples

      iex> import Algo.ReverseString
      iex> reverse2("abcd")
      "dcba"
      iex> reverse2("  abcd")
      "dcba  "
      iex> reverse2("ãáàéè")
      "èéàáã"
  """
  def reverse2(str) do
    str
    |> String.graphemes()
    |> reverse2_helper
    |> Enum.join("")
  end

  defp reverse2_helper([]), do: []

  defp reverse2_helper([h | t]) do
    reverse2_helper(t) ++ [h]
  end

  @doc """
  Reverse 3.

  ## Examples

      iex> import Algo.ReverseString
      iex> reverse3("abcd")
      "dcba"
      iex> reverse3("  abcd")
      "dcba  "
      iex> reverse3("ãáàéè")
      "èéàáã"
  """
  def reverse3(str) do
    str
    |> String.graphemes()
    |> Enum.reduce("", fn x, acc -> "#{x}#{acc}" end)
  end
end
