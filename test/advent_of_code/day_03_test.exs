defmodule AdventOfCode.Day03Test do
  use ExUnit.Case

  import AdventOfCode.Day03

  @example "467..114..
...*......
..35..633.
......#...
617*......
.....+.58.
..592.....
......755.
...$.*....
.664.598.."

  # @tag :skip
  test "part1" do
    input = @example
    result = part1(input)

    assert result == 4361
  end

  # @tag :skip
  test "part2" do
    input = @example
    result = part2(input)

    assert result == 467_835
  end

  # @tag :skip
  test "full_part1" do
    input = AdventOfCode.Input.get!(3, 2023)
    result = part1(input)

    assert result == 522_726
  end

  # @tag :skip
  test "full_part2" do
    input = AdventOfCode.Input.get!(3, 2023)
    result = part2(input)

    assert result == 81_721_933
  end
end
