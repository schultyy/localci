defmodule Localci.Repository do
  def clone(url, name) do
    System.cmd("git", ["clone", url, name])
  end
end
