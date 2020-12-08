defmodule Day2 do
	@input_file "day-2-input.txt"
	
  defp normalize_input(raw_input) do
		raw_input
		|> String.split("\n", trim: true)
  end

  defp get_input do
		{:ok, raw_input} = File.read(@input_file)
		normalize_input(raw_input)
  end
	
	def count_valid_passwords(input) do
		Enum.count(input, fn line ->
			%{ policy: policy, password: password } = parse_input_line(line)
			is_password_valid(policy, password)
		end)
	end
	
	defp is_password_valid(policy, password) do
		%{ min: min, max: max, letter: letter } = policy
		count = count_chars_in_string(password, letter)
		(count >= min) && (count <= max)
	end
	
	def count_chars_in_string(string, char) do
		string
		|> String.split("")
		|> Enum.count(fn x -> x == char end)			
	end
	
	# Example: "1-3 b: cdefg"
	# Pattern: (\d+)-(\d+) ([a-z]): ([a-z]+)
	# Named:   (?<min>\d+)-(?<max>\d+) (?<letter>[a-z]): (?<password>[a-z]+)
	def parse_input_line(line) do
		pattern = ~r/(?<min>\d+)-(?<max>\d+) (?<letter>[a-z]): (?<password>[a-z]+)/
		captures = Regex.named_captures(pattern, line)
		%{
			policy: %{
				min: String.to_integer(captures["min"]),
				max: String.to_integer(captures["max"]),
				letter: captures["letter"]
			},
			password: captures["password"]
		}
	end
	
	@doc """
		How many passwords are valid according to their policies?
	"""
	def part1 do
		count_valid_passwords get_input()
	end
	
	#@doc """
	#	Find the three entries that sum to 2020 and then multiply those three numbers together.
	#"""
	#def part2 do
	#	#product_of_three_entries_that_sum_to_2020 get_input()
	#end
end

IO.puts "Part 1: #{Day2.part1}"
#IO.puts "Part 2: #{Day2.part2}"
