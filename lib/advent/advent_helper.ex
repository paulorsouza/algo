defmodule Advent.Helper do
  @doc """
  Receive a string with lines and returs a List
  """
  def lines_to_list(lines) do
    lines
    |> String.trim()
    |> String.split("\n")
  end

  def file_to_list(path) do
    path
    |> File.stream!()
    |> Stream.map(&String.trim/1)
    |> Enum.to_list()
  end
end
