defmodule LocalciTest do
  use ExUnit.Case

  import Mock

  setup do
    stubs = [clone: fn(_url, _name) -> :ok end, remove: fn(_path) -> :ok end]
    {:ok, stubs: stubs}
  end

  test "without config file" do
    assert Localci.App.run() == :error
  end

  test "with config file", meta do
    with_mock Localci.Repository, meta[:stubs] do
      with_mock Localci.Build, [execute: fn(_cmd, _name)->:ok end] do
        assert Localci.App.run(configfile: "test/example_config.json") == :ok
      end
    end
  end
end
