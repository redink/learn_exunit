defmodule LearnExunitReversedToCodesTest do
  use ExUnit.Case

  test "unit test for reversed to codes" do
    assert :"1" == LearnExunit.to_to_atom(build_params_for_func("1"))
    assert :a == LearnExunit.to_to_atom(build_params_for_func("a"))

    assert :"1" == LearnExunit.to_atom("1")
    assert :a == LearnExunit.to_atom("a")
  end

  defp build_params_for_func(term) do
    [term: term]
  end

  # __end_of_module__
end
