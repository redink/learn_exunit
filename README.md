# LearnExunit

# entrance

## 1.0 start

```elixir
# test/test_helper.exs
ExUnit.start()
```
Mix will load the `test_helper.exs` file before executing the tests.

# cases

## 2.0 options

```elixir
use ExUnit.Case, async: true
```

> :async - configures tests in this module to run concurrently with tests in other modules. Tests in the same module do not run concurrently. It should be enabled only if tests do not change any global state. Defaults to false.

## 2.1 test macro

without context
```elixir
test "true is equal to true" do
  assert true == true
end
```

## 2.2 context

All tests receive a context as an argument. There are some ways to build the context before run all test cases in individual test module.

with context
```elixir
  test "unit test case with context", context do
    IO.inspect(context, label: "The context is:")
    assert true
  end
```

## 2.3 tags

  - timeout
  - capture_log
  - user-defined tag

## 2.4 Log Capture

> This default can be overridden by @tag capture_log: false or @moduletag capture_log: false.


# assertions

## 3.1 assert

```elixir
  test "unit test assert" do
    assert true
    assert 1
    assert ""
    assert !nil
    assert !false
    assert %{} = %{a: :a, b: :b}
    assert %{} != %{a: :a, b: :b}
  end
```

## 3.2 assert_raise

```elixir
  test "unit test assert_raise" do
    assert_raise ArithmeticError, "bad argument in arithmetic expression", fn -> 1 + :a end
    assert_raise RuntimeError, fn -> raise "oops" end
  end
```

## 3.3 assert_receive(d)

```elixir
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
```

## 3.4 catch_*

  error/exit/throw

## 3.5 refute

# callbacks

## 4.1 setup
## 4.2 setup_all

# mock

# Forced to codes

# coverage

# treat test cases code seriously
