#- wc: conta palavras, com a mesma funcionalidade do "wc" do linux.

defmodule WordCount do

  def count do
    filename = IO.gets("arquivo: ") |> String.trim
    body = File.read! filename
    count =
      String.split(body, ~r{\\n|[^\w]+})
      |> Enum.filter(fn x -> x != "" end)
      |> Enum.count
    IO.inspect count
  end

end
