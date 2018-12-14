defmodule Advent.ChronalCalibration do
  @moduledoc """
  --- Day 1: Chronal Calibration ---
  "We've detected some temporal anomalies," one of Santa's Elves at the Temporal Anomaly Research and Detection Instrument Station tells you. She sounded pretty worried when she called you down here. "At 500-year intervals into the past, someone has been changing Santa's history!"
  "The good news is that the changes won't propagate to our time stream for another 25 days, and we have a device" - she attaches something to your wrist - "that will let you fix the changes with no such propagation delay. It's configured to send you 500 years further into the past every few days; that was the best we could do on such short notice."
  "The bad news is that we are detecting roughly fifty anomalies throughout time; the device will indicate fixed anomalies with stars. The other bad news is that we only have one device and you're the best person for the job! Good lu--" She taps a button on the device and you suddenly feel like you're falling. To save Christmas, you need to get all fifty stars by December 25th.
  Collect stars by solving puzzles. Two puzzles will be made available on each day in the advent calendar; the second puzzle is unlocked when you complete the first. Each puzzle grants one star. Good luck!
  After feeling like you've been falling for a few minutes, you look at the device's tiny screen. "Error: Device must be calibrated before first use. Frequency drift detected. Cannot maintain destination lock." Below the message, the device shows a sequence of changes in frequency (your puzzle input). A value like +6 means the current frequency increases by 6; a value like -3 means the current frequency decreases by 3.
  """

  def final_frequency(input) do
    input
    |> String.split("\n", trim: true)
    |> sum_lines(_current_frequency = 0)
  end

  def frequency(input) do
    input
    |> String.splitter("\n", trim: true)
    |> Stream.map(fn line -> String.to_integer(line) end)
    |> Enum.sum()
  end

  def freq(input) do
    input
    |> Stream.map(fn line ->
      {integer, _leftover} = Integer.parse(line)
      integer
    end)
    |> Enum.sum()
  end

  def sum_lines([], acc), do: acc

  def sum_lines([line | lines], acc) do
    frequency = String.to_integer(line) + acc
    sum_lines(lines, frequency)
  end

  def repeated_frequency(input) do
    input
    |> Stream.map(fn line ->
      {integer, _leftover} = Integer.parse(line)
      integer
    end)
    |> Stream.cycle()
    |> Enum.reduce_while({0, [0]}, fn x, {current, seen_frequencies} ->
      new_freq = current + x

      if new_freq in seen_frequencies do
        {:halt, new_freq}
      else
        {:cont, {new_freq, [new_freq | seen_frequencies]}}
      end
    end)
  end

  def repeated_freq(input) do
    input
    |> Stream.map(fn line ->
      {integer, _leftover} = Integer.parse(line)
      integer
    end)
    |> Stream.cycle()
    |> Enum.reduce_while({0, MapSet.new([0])}, fn x, {current, seen_frequencies} ->
      new_freq = current + x

      if new_freq in seen_frequencies do
        {:halt, new_freq}
      else
        {:cont, {new_freq, MapSet.put(seen_frequencies, new_freq)}}
      end
    end)
  end

  def first_twice(input) do
    Process.put({__MODULE__, 0}, true)

    input
    |> Stream.map(fn line ->
      {integer, _leftover} = Integer.parse(line)
      integer
    end)
    |> Stream.cycle()
    |> Enum.reduce_while(0, fn x, current ->
      new_freq = current + x
      key = {__MODULE__, new_freq}

      if Process.get(key) do
        {:halt, new_freq}
      else
        Process.put({__MODULE__, new_freq}, true)
        {:cont, new_freq}
      end
    end)
  end
end
