defmodule AdventOfCode.Day03 do
  import Enum
  alias String, as: S

  def part1(input) do
    parts = input |> parse_matrix() |> find_all_parts()

    find_all_numbers(input)
    |> check_adjacent_symbol(parts)
    |> sum()
  end

  defp check_adjacent_symbol(numbers, parts) do
    map(numbers, &check_part_number(&1, parts))
  end

  defp check_part_number({row, start, stop, n}, parts) do
    case check_part_position(row, start - 1, row, start, stop, parts) do
      {:ok, _} -> n
      _ -> 0
    end
  end

  defp check_part_position(r, c, row, min, max, parts) when c < min and r == row do
    # move up if part symbol not found
    cond do
      MapSet.member?(parts, {r, c}) -> {:ok, {r, c}}
      true -> check_part_position(r - 1, c, row, min, max, parts)
    end
  end

  defp check_part_position(r, c, row, min, max, parts) when r < row and c <= max do
    # move right if part symbol not found
    cond do
      MapSet.member?(parts, {r, c}) -> {:ok, {r, c}}
      true -> check_part_position(r, c + 1, row, min, max, parts)
    end
  end

  defp check_part_position(r, c, row, min, max, parts) when c > max and r <= row do
    # move down if part symbol not found
    cond do
      MapSet.member?(parts, {r, c}) -> {:ok, {r, c}}
      true -> check_part_position(r + 1, c, row, min, max, parts)
    end
  end

  defp check_part_position(r, c, row, min, max, parts) when r > row and c >= min - 1 do
    # move left if part symbol not found
    cond do
      MapSet.member?(parts, {r, c}) -> {:ok, {r, c}}
      true -> check_part_position(r, c - 1, row, min, max, parts)
    end
  end

  defp check_part_position(_, _, _, _, _, _) do
    {:err, "part number not found"}
  end

  defp find_all_numbers(input) do
    # tuple format for each number is {row, start_col, end_col, value}
    S.split(input, "\n", trim: true)
    |> with_index()
    |> map(fn {s, r} ->
      Regex.scan(~r/(\d+)/, s, return: :index, capture: :all_but_first)
      |> map(fn [{c, len}] -> {r, c, c + len - 1, S.to_integer(S.slice(s, c, len))} end)
    end)
    |> List.flatten()
  end

  defp find_all_parts(matrix) do
    check_rows(matrix, ~r/[^\.\d]/, 0, []) |> MapSet.new()
  end

  defp check_rows(%{rows: max}, _, num, parts) when num >= max, do: parts

  defp check_rows(matrix = %{cols: col_max, data: rows}, target, num, parts) do
    case check_cols(col_max, elem(rows, num), target, 0, []) do
      [] -> check_rows(matrix, target, num + 1, parts)
      [col] -> check_rows(matrix, target, num + 1, [{num, col} | parts])
      cols -> check_rows(matrix, target, num + 1, zip([Stream.cycle([num]), cols]) ++ parts)
    end
  end

  defp check_cols(max, _, _, num, cols) when num >= max, do: cols

  defp check_cols(max, row, target, num, cols) do
    case elem(row, num) =~ target do
      false -> check_cols(max, row, target, num + 1, cols)
      true -> check_cols(max, row, target, num + 1, [num | cols])
    end
  end

  defp parse_matrix(input) do
    data =
      S.split(input, "\n", trim: true)
      |> map(fn s -> S.split(s, "", trim: true) |> List.to_tuple() end)
      |> List.to_tuple()

    %{:rows => tuple_size(data), :cols => tuple_size(elem(data, 0)), :data => data}
  end

  def part2(input) do
    parts = input |> parse_matrix() |> find_only_gears()

    find_all_numbers(input)
    |> check_gear_symbol(parts)
    |> map(fn {_, nums} -> if(length(nums) > 1, do: product(nums), else: 0) end)
    |> sum()
  end

  defp check_gear_symbol(numbers, parts) do
    map(numbers, &first_part_number(&1, parts))
    |> filter(& &1)
    |> group_by(&elem(&1, 1), &elem(&1, 0))
  end

  defp first_part_number({row, start, stop, n}, parts) do
    case check_part_position(row, start - 1, row, start, stop, parts) do
      {:ok, {r, c}} -> {n, {r, c}}
      _ -> false
    end
  end

  defp find_only_gears(matrix) do
    check_rows(matrix, ~r/\*/, 0, []) |> MapSet.new()
  end
end
