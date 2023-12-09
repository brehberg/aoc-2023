defmodule AdventOfCode.Day09 do
  def part1(input) do
    String.split(input, "\n", trim: true)
    |> Enum.map(fn line -> String.split(line) |> Enum.map(&String.to_integer/1) end)
    |> Enum.map(&find_sequence_next/1)
    |> Enum.sum()
  end

  defp find_sequence_next(values) do
    seq =
      Enum.chunk_every(values, 2, 1, :discard)
      |> Enum.map(fn [a, b] -> b - a end)

    cond do
      Enum.all?(seq, &(&1 == 0)) -> List.last(values)
      true -> find_sequence_next(seq) + List.last(values)
    end
  end

  def part2(input) do
    String.split(input, "\n", trim: true)
    |> Enum.map(fn line -> String.split(line) |> Enum.map(&String.to_integer/1) end)
    |> Enum.map(&find_sequence_prev/1)
    |> Enum.sum()
  end

  defp find_sequence_prev(values) do
    seq =
      Enum.chunk_every(values, 2, 1, :discard)
      |> Enum.map(fn [a, b] -> b - a end)

    cond do
      Enum.all?(seq, &(&1 == 0)) -> hd(values)
      true -> hd(values) - find_sequence_prev(seq)
    end
  end
end
