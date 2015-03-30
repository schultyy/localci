defmodule ConfigurationTest do
  use ExUnit.Case

  def read_config do
    File.read!("test/example_config.json")
  end

  setup do
    config = LocalCi.Configuration.parse(read_config)
    {:ok, config: config}
  end

  test "returns object from json", meta do
    assert meta[:config] != nil
  end
end
