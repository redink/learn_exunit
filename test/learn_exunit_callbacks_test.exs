defmodule LearnExunitCallbacksTest do
  use ExUnit.Case

  setup do
    # IO.puts("Generate random number 1 in setup")
    [random_num_1: Enum.random(1..1_000)]
  end

  setup :generate_random_number_2

  defp generate_random_number_2(context) do
    # IO.puts("Generate random number 2 in setup")
    context
    |> Map.put(:random_num_2, Enum.random(1..1_000))
  end

  test "setup case 1", %{random_num_1: random_num_1, random_num_2: random_num_2} = _context do
    IO.puts("The random numbers in case #1 are: {#{random_num_1}, #{random_num_2}}")
    assert true
  end

  test "setup case 2", %{random_num_1: random_num_1, random_num_2: random_num_2} = _context do
    IO.puts("The random numbers in case #2 are: {#{random_num_1}, #{random_num_2}}")
    assert true
  end

  setup_all do
    [setup_all_random_num_1: Enum.random(1..1_000)]
  end

  setup_all :generate_setup_all_random_number_2

  defp generate_setup_all_random_number_2(context) do
    context
    |> Map.put(:setup_all_random_num_2, Enum.random(1..1_000))
  end

  test "setup_all case 1", %{setup_all_random_num_1: num_1, setup_all_random_num_2: num_2} do
    IO.puts("The random numbers in case setup_all #1 are: {#{num_1}, #{num_2}}")
  end

  test "setup_all case 2", %{setup_all_random_num_1: num_1, setup_all_random_num_2: num_2} do
    IO.puts("The random numbers in case setup_all #2 are: {#{num_1}, #{num_2}}")
  end

  # __end_of_module__
end
