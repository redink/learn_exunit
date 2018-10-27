defmodule LearnExunitCasesTest do
  use ExUnit.Case
  @moduletag capture_log: true

  test "greets the world" do
    assert true
  end

  # mix test --trace --only os:unix
  @tag timeout: 6_000
  @tag os: "unix"
  test "unit test case with context", context do
    _ = context
    # IO.inspect(context, label: "The context is:")
    assert true
  end

  # mix test --trace --exclude failed
  @tag :failed
  test "this case will be failed" do
    assert false
  end

  # mix test --trace --only use_refute
  @tag :use_refute
  test "this case will use refute" do
    refute false
    refute nil
  end
end
