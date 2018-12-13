defmodule Advent.InventoryManagementSystem do
  @moduledoc """
  --- Day 2: Inventory Management System ---
  You stop falling through time, catch your breath, and check the screen on the device. "Destination reached. Current Year: 1518. Current Location: North Pole Utility Closet 83N10." You made it! Now, to find those anomalies.
  Outside the utility closet, you hear footsteps and a voice. "...I'm not sure either. But now that so many people have chimneys, maybe he could sneak in that way?" Another voice responds, "Actually, we've been working on a new kind of suit that would let him fit through tight spaces like that. But, I heard that a few days ago, they lost the prototype fabric, the design plans, everything! Nobody on the team can even seem to remember important details of the project!"
  "Wouldn't they have had enough fabric to fill several boxes in the warehouse? They'd be stored together, so the box IDs should be similar. Too bad it would take forever to search the warehouse for two similar box IDs..." They walk too far away to hear any more.
  Late at night, you sneak to the warehouse - who knows what kinds of paradoxes you could cause if you were discovered - and use your fancy wrist device to quickly scan every box and produce a list of the likely candidates (your puzzle input).
  To make sure you didn't miss any, you scan the likely candidate boxes again, counting the number that have an ID containing exactly two of any letter and then separately counting those with exactly three of any letter. You can multiply those two counts together to get a rudimentary checksum and compare it to what your device predicts.
  """

  def correct_box(boxes) do
    boxes
    |> Enum.map(&String.to_charlist/1)
    |> closest_id()

  end

  def closest_id(boxes) do
    boxes
    |> closest_id('')
  end

  def closest_id(_, closest_box) when length(closest_box) == 25 do
    closest_box
  end

  def closest_id([], closest_box) do
    closest_box
  end

  def closest_id([box | rest], closest_box) do
    closest = closest_chars(box, rest, closest_box)
    new_closest_box = if(length(closest_box) < length(closest)) do
      closest
    else
      closest_box
    end
    closest_id(rest, new_closest_box)
  end

  def closest_chars(_, _, closest_box) when length(closest_box) == 25 do
    closest_box
  end

  def closest_chars(_, '', closest_box) do
    closest_box
  end

  def closest_chars(left, [right | rest], closest_box)  do
    {current, _} = Enum.zip(left, right)
    |> Enum.filter(fn {a, b} -> a == b end)
    |> Enum.unzip()


    new_closest_box = if(length(closest_box) < length(current)) do
      current
    else
      closest_box
    end
    closest_chars(left, rest, new_closest_box)
  end



  def two_map(string) do
    string
    |> String.to_charlist()
    |> Enum.reduce(%{}, fn x, acc ->
      Map.update(acc, x, 1, & &1 + 1)
    end)
  end

  def comp(list) do
    {twice, thrice} = list
    |> Enum.map(fn x ->
      x |> two_map() |> get_twice_and_thrice
    end)
    |> Enum.reduce({0, 0}, fn {twice, thrice}, {total_twice, total_thrice} ->
      {twice + total_twice, thrice + total_thrice}
    end)
    twice * thrice
  end

  def checksum(list) do
    {twice, thrice} = list
    |> Enum.map(fn x ->
      x |> count_chars() |> get_twice_and_thrice
    end)
    |> Enum.reduce({0, 0}, fn {twice, thrice}, {total_twice, total_thrice} ->
      {twice + total_twice, thrice + total_thrice}
    end)
    twice * thrice
  end

  def get_twice_and_thrice(map) do
    map
    |> Enum.reduce({0, 0}, fn
      {_codepoint, 2}, {_twice, thrice} -> {1, thrice}
      {_codepoint, 3}, {twice, _thrice} -> {twice, 1}
      _, acc -> acc
    end)
  end

  def count_chars(string) when is_binary(string) do
    count_chars(string, %{})
  end

  def count_chars(<<codepoint::utf8, rest::binary>>, acc) do
    acc = Map.update(acc, codepoint, 1, & &1 + 1)
    count_chars(rest, acc)
  end

  def count_chars(_, acc), do: acc
end
