defmodule AdventOfCode.Day08Test do
  use ExUnit.Case

  import AdventOfCode.Day08

  @example "LLR

AAA = (BBB, BBB)
BBB = (AAA, ZZZ)
ZZZ = (ZZZ, ZZZ)"

  # @tag :skip
  test "part1" do
    input = @example
    result = part1(input)

    assert result == 6
  end

  @tag :skip
  test "part2" do
    input = "LR

11A = (11B, XXX)
11B = (XXX, 11Z)
11Z = (11B, XXX)
22A = (22B, XXX)
22B = (22C, 22C)
22C = (22Z, 22Z)
22Z = (22B, 22B)
XXX = (XXX, XXX)"
    result = part2(input)

    assert result == 6
  end

  # @tag :skip
  test "full_part1" do
    input = AdventOfCode.Input.get!(8, 2023)
    result = part1(input)

    assert result == 19783
  end

  @tag :skip
  test "full_part2" do
    input = AdventOfCode.Input.get!(8, 2023)
    result = part2(input)

    assert result
  end
end
