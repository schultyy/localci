defmodule Localci.App do
  def run do
    :error
  end

  def run(params) do
    params[:configfile]
      |> load_config
      |> remove
      |> clone
      |> build
    :ok
  end

  defp remove(config) do
    %{ "name" => name } = config
    Localci.Repository.remove(name)
    config
  end

  defp clone(config) do
    %{ "repository" => url } = config
    %{ "name" => name } = config
    Localci.Repository.clone(url, name)
    config
  end

  defp build(config) do
    %{ "name" => name } = config
    command = Map.get(config, "command", nil)

    command_list = cond do
      is_list(command) -> command
      command == nil -> []
      true -> [command]
    end

    Enum.each(command_list, fn(cmd) -> Localci.Build.execute(String.split(cmd), name) end)
  end

  defp load_config(filename) do
    {:ok, content} = File.read(filename)
    LocalCi.Configuration.parse(content)
  end
end
