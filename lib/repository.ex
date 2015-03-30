defmodule Localci.Repository do

  def remove(name) do
    File.rm_rf(name)
  end

  def clone(url, name) do
    System.cmd("git", ["clone", url, name])
  end
end
