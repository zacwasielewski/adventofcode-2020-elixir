ExUnit.start

defmodule Day2Test do
  use ExUnit.Case

  test "part_1_example_1" do
  	input = [
      "1-3 a: abcde",
      "1-3 b: cdefg",
      "2-9 c: ccccccccc",
    ]
  	assert Day2.Part1.count_valid_passwords(input) === 2
  end

  test "part_2_example_1" do
    input = [
      "1-3 a: abcde",
      "1-3 b: cdefg",
      "2-9 c: ccccccccc",
    ]
    assert Day2.Part2.count_valid_passwords(input) === 1
  end
end