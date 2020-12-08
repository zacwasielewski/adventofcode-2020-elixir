defmodule Day2 do
	@input_file "day-2-input.txt"
	
  defp normalize_input(raw_input) do
		raw_input
		|> String.split("\n", trim: true)
  end

  def get_input do
		{:ok, raw_input} = File.read(@input_file)
		normalize_input(raw_input)
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
	
	defmodule Part1 do
		def is_password_valid(policy, password) do
			%{ min: min, max: max, letter: letter } = policy
			count = count_chars_in_string(password, letter)
			(count >= min) && (count <= max)
		end
		
		def count_chars_in_string(string, char) do
			string
			|> String.split("")
			|> Enum.count(fn x -> x == char end)			
		end

		def count_valid_passwords(input) do
			Enum.count(input, fn line ->
				%{ policy: policy, password: password } = Day2.parse_input_line(line)
				is_password_valid(policy, password)
			end)
		end
		
		def solve do
			Part1.count_valid_passwords Day2.get_input
		end
	end
	
	defmodule Part2 do
		def is_password_valid(policy, password) do
			%{ min: n1, max: n2, letter: letter } = policy
			pos1_valid = String.at(password, n1-1) === letter
			pos2_valid = String.at(password, n2-1) === letter
			valid_positions = [ pos1_valid, pos2_valid ] |> Enum.count(fn x -> x === true end)
			valid_positions === 1
		end
		
		def count_valid_passwords(input) do
			Enum.count(input, fn line ->
				%{ policy: policy, password: password } = Day2.parse_input_line(line)
			is_password_valid(policy, password)
			end)
		end

		def solve do
			Part2.count_valid_passwords Day2.get_input
		end
	end
end

IO.puts "Part 1: #{Day2.Part1.solve}"
IO.puts "Part 2: #{Day2.Part2.solve}"
