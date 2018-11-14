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

  exit/throw

```elixir
  test "unit test assertions catch_*" do
    assert catch_exit(exit 1) == 1
    assert catch_throw(throw 1) == 1
  end
```

[Something about error raising exceptions in EVM](https://learnyousomeerlang.com/errors-and-exceptions)

## 3.5 refute

```elixir
  test "unit test refute" do
    refute nil
    refute false
  end
```

# callbacks

There are many usual callbacks for ExUnit:

- **setup**
- **setup_all**
- on_exit
- start_supervised
- stop_supervised

## 4.0 purpose

Build context for test case.

```elixir
  test "unit test case with context", context do
    IO.inspect(context, label: "The context is:")
    assert true
  end
```

The `context` is a map, can be used in each test case.

## 4.1 setup

- Optionally receive a map with test state and metadata.
- All `setup` callbacks are run before each test.
- Return `keyword list`/`map`/`{:ok, keywords | map}`/`:ok`.


```elixir
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
```

## 4.2 setup_all

- Optionally receive a map with test state and metadata.
- Return `keyword list`/`map`/`{:ok, keywords | map}`/`:ok`.
- Invoked only once per module.

```elixir
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
```

# mock

# Forced to codes

# coverage

# treat test cases code seriously
