defmodule AdventOfCode.Day07 do
  def part1(input) do
    String.split(input, "\n", trim: true)
    |> Enum.map(&parse_hand/1)
    |> Enum.sort_by(&score_hand/1)
    |> total_winnings(1, 0)
  end

  defp parse_hand(line) do
    [hand, bid] = String.split(line)
    {String.split(hand, "", trim: true), String.to_integer(bid)}
  end

  defp total_winnings([], _, sum), do: sum

  defp total_winnings([{_, bid} | rest], n, sum),
    do: total_winnings(rest, n + 1, sum + bid * n)

  defp score_hand({cards = [a, b, c, d, e], _}) do
    get_type(Enum.sort(cards)) * 10_000_000_000 +
      card_value(a) * 100_000_000 +
      card_value(b) * 1_000_000 +
      card_value(c) * 10000 +
      card_value(d) * 100 +
      card_value(e) * 1
  end

  defp card_value("A"), do: 14
  defp card_value("K"), do: 13
  defp card_value("Q"), do: 12
  defp card_value("J"), do: 11
  defp card_value("T"), do: 10
  defp card_value("X"), do: 1
  defp card_value(d), do: String.to_integer(d)

  # Five of a kind
  defp get_type([c, c, c, c, c]), do: 6
  defp get_type([c, c, c, c, x]) when x == "X", do: 6
  defp get_type([c, c, c, x, x]) when x == "X", do: 6
  defp get_type([c, c, x, x, x]) when x == "X", do: 6
  defp get_type([_, x, x, x, x]) when x == "X", do: 6
  # Four of a kind
  defp get_type([c, c, c, c, _]), do: 5
  defp get_type([_, c, c, c, c]), do: 5
  defp get_type([c, c, c, _, x]) when x == "X", do: 5
  defp get_type([_, c, c, c, x]) when x == "X", do: 5
  defp get_type([c, c, _, x, x]) when x == "X", do: 5
  defp get_type([_, c, c, x, x]) when x == "X", do: 5
  defp get_type([_, _, x, x, x]) when x == "X", do: 5
  # Full house
  defp get_type([c, c, c, y, y]), do: 4
  defp get_type([y, y, c, c, c]), do: 4
  defp get_type([c, c, y, y, x]) when x == "X", do: 4
  # Three of a kind
  defp get_type([c, c, c, _, _]), do: 3
  defp get_type([_, c, c, c, _]), do: 3
  defp get_type([_, _, c, c, c]), do: 3
  defp get_type([c, c, _, _, x]) when x == "X", do: 3
  defp get_type([_, c, c, _, x]) when x == "X", do: 3
  defp get_type([_, _, c, c, x]) when x == "X", do: 3
  defp get_type([_, _, _, x, x]) when x == "X", do: 3
  # Two pair
  defp get_type([c, c, y, y, _]), do: 2
  defp get_type([c, c, _, y, y]), do: 2
  defp get_type([_, c, c, y, y]), do: 2
  # One pair
  defp get_type([c, c, _, _, _]), do: 1
  defp get_type([_, c, c, _, _]), do: 1
  defp get_type([_, _, c, c, _]), do: 1
  defp get_type([_, _, _, c, c]), do: 1
  defp get_type([_, _, _, _, x]) when x == "X", do: 1
  # High card
  defp get_type(_), do: 0

  def part2(input) do
    String.replace(input, "J", "X")
    |> String.split("\n", trim: true)
    |> Enum.map(&parse_hand/1)
    |> Enum.sort_by(&score_hand/1)
    |> total_winnings(1, 0)
  end
end
