defmodule AdventOfCode.Day07Test do
  use ExUnit.Case

  import AdventOfCode.Day07

  @example "32T3K 765
T55J5 684
KK677 28
KTJJT 220
QQQJA 483"

  # @tag :skip
  test "part1" do
    input = @example
    result = part1(input)

    assert result == 6440
  end

  # @tag :skip
  test "part2" do
    input = @example
    result = part2(input)

    assert result == 5905
  end

  # @tag :skip
  test "full_part1" do
    input = AdventOfCode.Input.get!(7, 2023)
    result = part1(input)

    assert result == 251_545_216
  end

  # @tag :skip
  test "full_part2" do
    input = AdventOfCode.Input.get!(7, 2023)
    result = part2(input)

    assert result == 250_384_185
  end
end
