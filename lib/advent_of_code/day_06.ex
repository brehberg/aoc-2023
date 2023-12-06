defmodule AdventOfCode.Day06 do
  def part1(input) do
    String.split(input, "\n", trim: true)
    |> Enum.map(fn line ->
      Regex.scan(~r/(\d+)/, line, capture: :all_but_first)
      |> Enum.map(fn s -> String.to_integer(hd(s)) end)
    end)
    |> List.zip()
    |> Enum.map(&compute_ways(&1, elem(&1, 0) - 1, 0))
    |> Enum.product()
  end

  defp compute_ways({_, _}, 0, ways), do: ways

  defp compute_ways({time, best}, hold, ways) do
    if(hold * (time - hold) > best,
      do: compute_ways({time, best}, hold - 1, ways + 1),
      else: compute_ways({time, best}, hold - 1, ways)
    )
  end

  def part2(input) do
    [time, best] =
      String.split(input, "\n", trim: true)
      |> Enum.map(fn line ->
        Regex.scan(~r/(\d+)/, line, capture: :all_but_first) |> Enum.join() |> String.to_integer()
      end)

    compute_ways({time, best}, time - 1, 0)
  end
end
