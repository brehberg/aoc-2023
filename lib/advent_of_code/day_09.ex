defmodule AdventOfCode.Day09 do
  import Enum

  def part1(input) do
    String.split(input, "\n", trim: true)
    |> map(&parse_line/1)
    |> map(&find_sequence_next/1)
    |> sum()
  end

  defp find_sequence_next(values) do
    seq = calc_differences(values)

    cond do
      all?(seq, &(&1 == 0)) -> List.last(values)
      true -> find_sequence_next(seq) + List.last(values)
    end
  end

  defp calc_differences(values),
    do: chunk_every(values, 2, 1, :discard) |> map(fn [a, b] -> b - a end)

  defp parse_line(line),
    do: String.split(line) |> map(&String.to_integer/1)

  def part2(input) do
    String.split(input, "\n", trim: true)
    |> map(&parse_line/1)
    |> map(&find_sequence_prev/1)
    |> sum()
  end

  defp find_sequence_prev(values) do
    seq = calc_differences(values)

    cond do
      all?(seq, &(&1 == 0)) -> hd(values)
      true -> hd(values) - find_sequence_prev(seq)
    end
  end
end
