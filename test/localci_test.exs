defmodule LocalciTest do
  use ExUnit.Case

  test "without config file" do
    assert Localci.App.run() == :error
  end

  test "with config file" do
    assert Localci.App.run(configfile: "test/example_config.json") == :ok
  end
end
