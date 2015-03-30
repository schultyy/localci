require Logger
require JSON

defmodule Localci do
  def main(args) do
    parse_args(args) |> Localci.App.run
  end

  defp parse_args(args) do
    {options, _, _} = OptionParser.parse(args,
      switches: [configfile: :string]
    )
    options
  end
end
