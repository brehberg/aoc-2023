defmodule AdventOfCode.Day08 do
  def part1(input) do
    [dirs | network] = String.split(input, "\n", trim: true)
    dirs = String.split(dirs, "", trim: true)

    Enum.map(network, &parse_network/1)
    |> Map.new()
    |> count_steps(dirs, dirs, "AAA", 0)
  end

  defp parse_network(line) do
    [[node], [left], [right]] = Regex.scan(~r/(\w{3})/, line, capture: :first)
    {node, {left, right}}
  end

  defp count_steps(_, _, _, "ZZZ", n), do: n

  defp count_steps(map, dirs, [next | rest], node, n) do
    {left, right} = Map.get(map, node)
    rem = if rest == [], do: dirs, else: rest

    case next do
      "L" -> count_steps(map, dirs, rem, left, n + 1)
      "R" -> count_steps(map, dirs, rem, right, n + 1)
    end
  end

  def part2(input) do
    [dirs | network] = String.split(input, "\n", trim: true)
    dirs = String.split(dirs, "", trim: true)

    Enum.map(network, &parse_network/1)
    |> Map.new()
    |> count_steps_part2(dirs, dirs, "AAA", 0)
  end

  defp count_steps_part2(_, _, _, "ZZZ", n), do: n

  defp count_steps_part2(map, dirs, [next | rest], node, n) do
    {left, right} = Map.get(map, node)
    rem = if rest == [], do: dirs, else: rest

    case next do
      "L" -> count_steps(map, dirs, rem, left, n + 1)
      "R" -> count_steps(map, dirs, rem, right, n + 1)
    end
  end
end
