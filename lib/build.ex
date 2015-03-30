defmodule Localci.Build do
  def execute([command|args], working_dir) do
    System.cmd(command, args, into: IO.stream(:stdio, :line), cd: "#{working_dir}/")
  end
end
