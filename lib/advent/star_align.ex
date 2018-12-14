defmodule Advent.StarAlign do
  def get_cordinates(list) do
    list
    |> Enum.map(&parse/1)
  end

  def parse(star) do
    [x, y, j, k] =
      Regex.run(
        ~r{\Aposition=<\s*(-?\d+), \s*(-?\d+)>\s+velocity=<\s*(-?\d+), \s*(-?\d+)>\z},
        star,
        capture: :all_but_first
      )
      |> Enum.map(&String.to_integer/1)

    %{position: %{x: x, y: y}, velocity: %{x: j, y: k}}
  end

  def align(list) do
    list
    |> get_cordinates
    |> wait_for_message(nil)
    |> view_sky
  end

  def view_sky({stars, bounding}) do
    by_position = Enum.group_by(stars, fn star -> {star.position.x, star.position.y} end)

    Enum.map(bounding.y, fn y ->
      Enum.reduce(bounding.x, "", fn x, row ->
        row <>
          case by_position[{x, y}] do
            star when is_list(star) -> "#"
            nil -> "."
          end
      end)
    end)
    |> Enum.join("\n")
  end

  def move_stars(stars) do
    stars
    |> Enum.map(fn star ->
      %{
        star
        | position: %{x: star.position.x + star.velocity.x, y: star.position.y + star.velocity.y}
      }
    end)
  end

  def compute_bounding(stars) do
    {low_x, high_x} = Enum.map(stars, fn star -> star.position.x end) |> Enum.min_max()
    {low_y, high_y} = Enum.map(stars, fn star -> star.position.y end) |> Enum.min_max()
    %{x: low_x..high_x, y: low_y..high_y}
  end

  def wait_for_message(stars, bounding) do
    new_stars = move_stars(stars)
    new_bouding = compute_bounding(new_stars)

    if size_of(new_bouding) > size_of(bounding) do
      {stars, bounding}
    else
      wait_for_message(new_stars, new_bouding)
    end
  end

  def count(stars, bounding, count) do
    new_stars = move_stars(stars)
    new_bouding = compute_bounding(new_stars)

    if size_of(new_bouding) > size_of(bounding) do
      count
    else
      count(new_stars, new_bouding, count + 1)
    end
  end

  def size_of(nil) do
    :infinity
  end

  def size_of(%{x: x, y: y}) do
    (x.last - x.first) * (y.last - y.first)
  end
end
