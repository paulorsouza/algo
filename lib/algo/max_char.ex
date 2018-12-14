defmodule Algo.MaxChar do
  @moduledoc """
  Given a string, return the character that is most commonly used in the string
  """

  @doc """
  Max char

  ## Examples

      iex> import Algo.MaxChar
      iex> max_char("abcccccccd")
      "c"
      iex> max_char("apple 12311111")
      "1"
  """
  def max_char(string) do
    mapped_string = map_string(string)

    {key, _} =
      Enum.max_by(mapped_string, fn map ->
        {_, value} = map
        value
      end)

    key
  end

  defp map_string(string) do
    string
    |> String.graphemes()
    |> Enum.reduce(%{}, &map_string/2)
  end

  defp map_string(char, acc) do
    case Map.get(acc, char) do
      nil -> Map.put_new(acc, char, 1)
      value -> Map.put(acc, char, value + 1)
    end
  end
end
