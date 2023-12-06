defmodule AdventOfCode.Day02 do
  def part1(input) do
    String.split(input, "\n", trim: true)
    |> Enum.map(&parse_game/1)
    |> Enum.reduce(0, fn {game, cubes}, acc ->
      if(List.flatten(cubes) |> Enum.all?(), do: acc + game, else: acc)
    end)
  end

  defp parse_game(record) do
    [game, cubes] = String.split(record, ":")

    {
      Regex.run(~r/\d+/, game) |> hd() |> String.to_integer(),
      String.split(cubes, ";")
      |> Enum.map(&parse_cubes/1)
      |> Enum.map(&check_cubes/1)
    }
  end

  defp parse_cubes(string) do
    [
      Regex.run(~r/(\d+) red/, string, capture: :all_but_first),
      Regex.run(~r/(\d+) green/, string, capture: :all_but_first),
      Regex.run(~r/(\d+) blue/, string, capture: :all_but_first)
    ]
  end

  defp check_cubes([red, green, blue]) do
    [
      red == nil || String.to_integer(hd(red)) <= 12,
      green == nil || String.to_integer(hd(green)) <= 13,
      blue == nil || String.to_integer(hd(blue)) <= 14
    ]
  end

  defp parse_game_part2(record) do
    [game, cubes] = String.split(record, ":")

    {
      Regex.run(~r/\d+/, game) |> hd() |> String.to_integer(),
      String.split(cubes, ";")
      |> Enum.map(&parse_cubes/1)
      |> Enum.map(&count_cubes/1)
      |> List.zip()
    }
  end

  defp count_cubes([red, green, blue]) do
    [
      if(red == nil, do: 0, else: String.to_integer(hd(red))),
      if(green == nil, do: 0, else: String.to_integer(hd(green))),
      if(blue == nil, do: 0, else: String.to_integer(hd(blue)))
    ]
  end

  def part2(input) do
    String.split(input, "\n", trim: true)
    |> Enum.map(&parse_game_part2/1)
    |> Enum.reduce(0, fn {_, [red, green, blue]}, acc ->
      acc +
        Enum.max(Tuple.to_list(red)) *
          Enum.max(Tuple.to_list(green)) *
          Enum.max(Tuple.to_list(blue))
    end)
  end
end
