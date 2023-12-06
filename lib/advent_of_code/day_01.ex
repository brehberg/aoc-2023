defmodule AdventOfCode.Day01 do
  def part1(input) do
    String.split(input, "\n", trim: true)
    |> Enum.map(fn line ->
      Enum.join([
        Regex.run(~r/(\d).*$/, line, capture: :all_but_first),
        Regex.run(~r/^.*(\d)/, line, capture: :all_but_first)
      ])
    end)
    |> Enum.reduce(0, fn str, acc -> acc + String.to_integer(str) end)
  end

  @first_digit ~r/(one|two|three|four|five|six|seven|eight|nine|\d).*$/
  @last_digit ~r/^.*(one|two|three|four|five|six|seven|eight|nine|\d)/
  def part2(input) do
    String.split(input, "\n", trim: true)
    |> Enum.map(fn line ->
      [
        Regex.run(@first_digit, line, capture: :all_but_first),
        Regex.run(@last_digit, line, capture: :all_but_first)
      ]
    end)
    |> List.flatten()
    |> Enum.map(fn digit ->
      case digit do
        "one" -> "1"
        "two" -> "2"
        "three" -> "3"
        "four" -> "4"
        "five" -> "5"
        "six" -> "6"
        "seven" -> "7"
        "eight" -> "8"
        "nine" -> "9"
        _ -> digit
      end
    end)
    |> Enum.chunk_every(2)
    |> Enum.reduce(0, fn strs, acc -> acc + String.to_integer(Enum.join(strs)) end)
  end
end
