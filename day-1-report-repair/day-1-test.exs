ExUnit.start

defmodule Day1Test do
  use ExUnit.Case

  test "part_1_example_1" do
  	input = [
  		1721,
  		979,
  		366,
  		299,
  		675,
  		1456
  	]
  	assert Day1.product_of_two_entries_that_sum_to_2020(input) === 514579
  end

  test "part_2_example_1" do
    input = [
      1721,
      979,
      366,
      299,
      675,
      1456
    ]
    assert Day1.product_of_three_entries_that_sum_to_2020(input) === 241861950
  end
end