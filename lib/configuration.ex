defmodule LocalCi.Configuration do
  def parse(json) do
    {:ok, content} = JSON.decode(json)
    content
  end
end
