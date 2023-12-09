defmodule AdventOfCode.Day09Test do
  use ExUnit.Case

  import AdventOfCode.Day09

  @example "0 3 6 9 12 15
1 3 6 10 15 21
10 13 16 21 30 45"

  # @tag :skip
  test "part1" do
    input = @example
    result = part1(input)

    assert result == 114
  end

  # @tag :skip
  test "part2" do
    input = @example
    result = part2(input)

    assert result == 2
  end

  # @tag :skip
  test "full_part1" do
    input = AdventOfCode.Input.get!(9, 2023)
    result = part1(input)

    assert result == 1_861_775_706
  end

  # @tag :skip
  test "full_part2" do
    input = AdventOfCode.Input.get!(9, 2023)
    result = part2(input)

    assert result == 1082
  end
end
