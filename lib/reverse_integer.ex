defmodule ReverseInteger do

  @moduledoc """
  Given an integer, return an integer that is the reverse
  ordering of numbers.
  """

  @doc """
  Reverse integer

  ## Examples

      iex> ReverseInteger.reverse_int(0)
      0
      iex> ReverseInteger.reverse_int(051)
      15
      iex> ReverseInteger.reverse_int(-015)
      -51
  """
  def reverse_int(int) do
    { reversal, _ } = int
    |> Integer.to_string()
    |> String.reverse()
    |> Integer.parse()

    int < 0 && reversal * -1 || reversal
  end
end
