defmodule ConfigurationTest do
  use ExUnit.Case

  def read_config do
    File.read!("test/example_config.json")
  end


  test "returns object from json" do
    config = LocalCi.Configuration.parse(read_config)

    assert config != nil
  end
end
