require Logger
require JSON

defmodule Localci do
  def main(args) do
    params = parse_args(args)
    filename = params[:configfile]
    {:ok, content} = File.read(filename)
    config = LocalCi.Configuration.parse(content)
    Logger.info inspect(config)
  end

  defp parse_args(args) do
    {options, _, _} = OptionParser.parse(args,
      switches: [configfile: :string]
    )
    options
  end
end
