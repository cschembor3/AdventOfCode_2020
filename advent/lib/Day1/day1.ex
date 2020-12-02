defmodule Day1 do
  @moduledoc """
  Documentation for `Day1`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Day1.hello()
      :world

  """
  def part1 do
    set = MapSet.new()
    read_file_contents()
    |> Enum.map(fn a -> get_matching_num(a) end)
    |> part1_helper(set)

  end

  defp part1_helper(nums, set) do
    case nums do
      [head | tail] -> 
        IO.inspect(set |> MapSet.to_list)
        matching_num = get_matching_num(head)
        IO.puts("matching num: #{matching_num}")
        if set |> MapSet.member?(matching_num) do
          IO.puts("answer: #{head * matching_num}")
        else
            set = set |> MapSet.put(head)
            part1_helper(tail, set)
        end
            _ -> 1
    end
  end

  defp read_file_contents do
    File.stream!("input.txt")
      |> Enum.map(&String.trim/1)
      |> Enum.map(&String.to_integer/1)
  end

  defp get_matching_num(num) do
    2020 - num
  end
end
