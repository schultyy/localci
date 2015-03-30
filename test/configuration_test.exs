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

  test "has repository property", meta do
    assert meta[:config]["repository"] == "git@github.com:schultyy/pulp.git"
  end

  test "has name property", meta do
    assert meta[:config]["name"] == "pulp"
  end

  test "has command property", meta do
    assert meta[:config]["command"] == "bundle exec rake"
  end
end
