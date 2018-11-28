defmodule Chunk do
  @moduledoc """
  Given an array and chunk size, divide the array into many subarrays
  where each subarray is of length size
  """

  @doc """
  Chunk

  ## Examples
      iex> Chunk.chunk([1,2,3,4], 2)
      [[1,2],[3,4]]
  """
  def chunk(arr, length) do
    chunk(arr, length, [], [])
  end

  defp chunk([], length, chunked, last) do
    if (Enum.count(last) <= length) do
      chunked ++ [last]
    else
      chunked
    end
  end

  defp chunk([h | t], length, chunked, last) do
    cond do
      Enum.count(last) == length -> chunk(t, length, chunked ++ [last], [h])
      true -> chunk(t, length, chunked, last ++ [h])
    end
  end
end
