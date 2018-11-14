defmodule LearnExunitAssertionsTest do
  use ExUnit.Case

  import Mock

  test "unit test mock with one mocked module" do
    with_mock(ModuleA, cross_gwf: fn -> :ok end, kill_gwf: fn _ -> true end) do
      assert :ok == ModuleA.cross_gwf()
      assert true == ModuleA.kill_gwf(nil)
    end
  end

  test_with_mock "unit test mock using macro test_with_mock", ModuleA, [],
    cross_gwf: fn -> :ok end,
    kill_gwf: fn _ -> true end do
    assert :ok == ModuleA.cross_gwf()
    assert true == ModuleA.kill_gwf(nil)
  end

  test "unit test mock with multi-mocked modules" do
    with_mocks([
      {ModuleA, [], [cross_gwf: fn -> :ok end, kill_gwf: fn _ -> true end]},
      {ModuleB, [], [cross_gwf: fn -> :ok end, kill_gwf: fn _ -> true end]}
    ]) do
      assert :ok == ModuleA.cross_gwf()
      assert true == ModuleA.kill_gwf(nil)
      assert :ok == ModuleB.cross_gwf()
      assert true == ModuleB.kill_gwf(nil)
    end
  end

  setup_with_mocks([
    {ModuleA, [], [cross_gwf: fn -> 1 end, kill_gwf: fn _ -> 2 end]},
    {ModuleB, [], [cross_gwf: fn -> 1 end, kill_gwf: fn _ -> 2 end]}
  ]) do
    :ok
  end

  test "unit test mock use setup with setup with mocks modulea" do
    assert 1 == ModuleA.cross_gwf()
    assert 2 == ModuleA.kill_gwf(nil)
  end

  test "unit test mock use setup with setup with mocks moduleb" do
    assert 1 == ModuleB.cross_gwf()
    assert 2 == ModuleB.kill_gwf(nil)
  end

  # __end_of_module__
end
