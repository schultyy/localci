require Logger
require JSON

defmodule Localci do
  def main(args) do
    params = parse_args(args)
    config = params[:configfile] |> load_config
    Logger.info inspect(config)
  end

  defp load_config(filename) do
    {:ok, content} = File.read(filename)
    LocalCi.Configuration.parse(content)
  end

  defp parse_args(args) do
    {options, _, _} = OptionParser.parse(args,
      switches: [configfile: :string]
    )
    options
  end
end
