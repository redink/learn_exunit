defmodule LearnExunitAssertionsTest do
  use ExUnit.Case

  test "unit test assert" do
    assert true
    assert 1
    assert ""
    assert !nil
    assert !false
    assert %{} = %{a: :a, b: :b}
    assert %{} != %{a: :a, b: :b}
  end

  test "unit test assert_raise" do
    assert_raise ArithmeticError, "bad argument in arithmetic expression", fn -> 1 + :a end
    assert_raise RuntimeError, fn -> raise "oops" end
  end

  test "unit test assert_receive" do
    main_pid = self()

    spawn(fn ->
      Process.sleep(1_000)
      send(main_pid, {:ok, self()})
    end)

    assert_receive {:ok, _}, 2_000
  end

  test "unit test assert_received" do
    send(self(), {:ok, self()})
    assert_received {:ok, _}
  end

  test "unit test assertions catch_*" do
    assert catch_exit(exit(1)) == 1
    assert catch_throw(throw(1)) == 1
  end

  test "unit test refute" do
    refute nil
    refute false
  end

  # __end_of_module__
end
