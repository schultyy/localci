defmodule LocalciTest do
  use ExUnit.Case

  import Mock

  setup do
    repository_stubs = [clone: fn(_url, _name) -> :ok end, remove: fn(_path) -> :ok end]
    {:ok, repo_stubs: repository_stubs}
  end

  test "without config file" do
    assert Localci.App.run() == :error
  end

  test "with config file", meta do
    with_mock Localci.Repository, meta[:repo_stubs] do
      with_mock Localci.Build, [execute: fn(_cmd, _name)->:ok end] do
        assert Localci.App.run(configfile: "test/example_config.json") == :ok
      end
    end
  end

  test "clones correctly", meta do
    with_mock Localci.Repository, meta[:repo_stubs] do
      with_mock Localci.Build, [execute: fn(_cmd, _name)->:ok end] do
        Localci.App.run(configfile: "test/example_config.json")
        assert called Localci.Repository.clone("git@github.com:schultyy/pulp.git", "pulp")
      end
    end
  end

  test "removes old repository", meta do
    with_mock Localci.Repository, meta[:repo_stubs] do
      with_mock Localci.Build, [execute: fn(_cmd, _name)->:ok end] do
        Localci.App.run(configfile: "test/example_config.json")
        assert called Localci.Repository.remove("pulp")
      end
    end
  end

  test "executes build command", meta do
    with_mock Localci.Repository, meta[:repo_stubs] do
      with_mock Localci.Build, [execute: fn(_cmd, _name)->:ok end] do
        Localci.App.run(configfile: "test/example_config.json")
        assert called Localci.Build.execute(["bundle", "exec", "rake"], "pulp")
      end
    end
  end

  test "config without build command", meta do
    with_mock Localci.Repository, meta[:repo_stubs] do
      with_mock Localci.Build, [execute: fn(_cmd, _name) -> raise "must not be called" end] do
        Localci.App.run(configfile: "test/example_config_wo_build.json")
      end
    end
  end
end
