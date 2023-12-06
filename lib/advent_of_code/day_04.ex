defmodule AdventOfCode.Day04 do
  def part1(input) do
    String.split(input, "\n", trim: true)
    |> Enum.map(&String.split(&1, ~r/[:|]/))
    |> Enum.map(fn [_card, winning, numbers] ->
      count_winners(
        String.split(winning) |> Enum.map(&String.to_integer/1),
        String.split(numbers) |> Enum.map(&String.to_integer/1)
      )
    end)
    |> Enum.reduce(0, fn n, acc ->
      if(n > 0, do: acc + 2 ** (n - 1), else: acc)
    end)
  end

  defp count_winners(winning, numbers),
    do: Enum.count(numbers, &Enum.member?(winning, &1))

  def part2(input) do
    String.split(input, "\n", trim: true)
    |> Enum.map(&String.split(&1, ~r/[:|]/))
    |> Enum.reduce(%{}, fn [card, winning, numbers], map ->
      Map.merge(map, %{
        (Regex.run(~r/\d+/, card) |> hd() |> String.to_integer()) => [
          1,
          count_winners(
            String.split(winning) |> Enum.map(&String.to_integer/1),
            String.split(numbers) |> Enum.map(&String.to_integer/1)
          )
        ]
      })
    end)
    |> count_cards(0, 1)
  end

  defp count_cards(cards, total, _) when map_size(cards) == 0, do: total

  defp count_cards(cards, total, next) do
    {[count, winners], remaining} = Map.pop(cards, next)

    update_counts(remaining, winners, count, next + 1)
    |> count_cards(total + count, next + 1)
  end

  defp update_counts(cards, 0, _, _), do: cards

  defp update_counts(cards, count, num, next) do
    Map.update!(cards, next, fn [current, winners] ->
      [current + num, winners]
    end)
    |> update_counts(count - 1, num, next + 1)
  end
end
