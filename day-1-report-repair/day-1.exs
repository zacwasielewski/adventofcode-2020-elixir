defmodule Day1 do
	@input_file "day-1-input.txt"
	
  defp normalize_input(input) do
		input
		|> String.split("\n", trim: true)
		|> Enum.map(&String.to_integer/1)
  end

  defp get_input do
		{:ok, input} = File.read(@input_file)
		normalize_input(input)
  end

	# Stolen from https://www.adiiyengar.com/blog/20190608/elixir-combinations
	def combinations(list, num)
	def combinations(_list, 0), do: [[]]
	def combinations(list = [], _num), do: list
	def combinations([head | tail], num) do
		Enum.map(combinations(tail, num - 1), &[head | &1]) ++
			combinations(tail, num)
	end
	
	def find_two_numbers_that_sum_to(sum, input) do
		match = Enum.find(input, fn n ->
			Enum.member?(List.delete(input, n), (sum - n))
		end)
		
		[match, sum - match]
	end
	
	def find_three_numbers_that_sum_to(sum, input) do
		Enum.find(combinations(input, 3), fn [n1, n2, n3] ->
			(n1 + n2 + n3) === sum
		end)
	end

	def product_of_two_entries_that_sum_to_2020(input) do
		[n1, n2] = find_two_numbers_that_sum_to(2020, input)
		n1 * n2
	end

	def product_of_three_entries_that_sum_to_2020(input) do
		[n1, n2, n3] = find_three_numbers_that_sum_to(2020, input)
		n1 * n2 * n3
	end
	
	@doc """
		Find the two entries that sum to 2020 and then multiply those two numbers together.
	"""
	def part1 do
		product_of_two_entries_that_sum_to_2020 get_input()
	end
	
	@doc """
		Find the three entries that sum to 2020 and then multiply those three numbers together.
	"""
	def part2 do
		product_of_three_entries_that_sum_to_2020 get_input()
	end
end

IO.puts "Part 1: #{Day1.part1}"
IO.puts "Part 2: #{Day1.part2}"
