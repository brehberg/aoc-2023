defmodule AdventOfCode.Day05 do
  def part1(input) do
    String.split(input, "\n", trim: true)
    |> parse_input({}, %{})
    |> Map.pop("init")
    |> convert_codes()
    |> Enum.min()
  end

  defp convert_codes({{_, codes}, maps}) when map_size(maps) == 0, do: codes

  defp convert_codes({{key, codes}, maps}) do
    {{next_key, ranges}, next_maps} = Map.pop(maps, key)
    convert_codes({{next_key, Enum.map(codes, &translate(&1, ranges))}, next_maps})
  end

  defp translate(code, []), do: code

  defp translate(code, [[range, offset] | rest]) do
    cond do
      code in range -> code + offset
      true -> translate(code, rest)
    end
  end

  defp parse_input([], {key, value}, maps), do: Map.put(maps, key, value)

  defp parse_input([head | rest], {}, maps) do
    value =
      String.trim_leading(head, "seeds: ")
      |> String.split()
      |> Enum.map(&String.to_integer/1)

    parse_input(rest, {"init", {"seed", value}}, maps)
  end

  defp parse_input(lines, current, maps) do
    cond do
      Regex.match?(~r/map:/, hd(lines)) -> start_new_map(lines, current, maps)
      true -> add_map_item(lines, current, maps)
    end
  end

  defp start_new_map([head | rest], {key, value}, maps) do
    [src, dest] = Regex.run(~r/(.*)-to-(.*) map:/, head, capture: :all_but_first)
    parse_input(rest, {src, {dest, []}}, Map.put(maps, key, value))
  end

  defp add_map_item([head | rest], {key, {to, value}}, maps) do
    [dest, src, len] = String.split(head) |> Enum.map(&String.to_integer/1)
    parse_input(rest, {key, {to, [[src..(src + len - 1), dest - src] | value]}}, maps)
  end

  defp expand_seeds({{key, codes}, maps}) do
    new_codes =
      Enum.chunk_every(codes, 2)
      |> Enum.flat_map(fn [start, len] ->
        Enum.to_list(start..(start + len - 1))
      end)

    {{key, new_codes}, maps}
  end

  def part2(input) do
    String.split(input, "\n", trim: true)
    |> parse_input({}, %{})
    |> Map.pop("init")
    |> expand_seeds()
    |> convert_codes()
    |> Enum.min()
  end
end
