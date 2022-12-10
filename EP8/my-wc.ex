# my-wc

defmodule WordCount do

@moduledoc """
define a função para ler um arquivo e contar a quantidade de palavras dentro do arquivo;
"""

  def count do
    filename = IO.gets("arquivo: ") |> String.trim
    body = File.read! filename
    count =
      String.split(body, ~r{\\n|[^\w]+}) #aqui se define os caracteres de espaço e nova linha para fazer o split das palavras no arquivo;
      |> Enum.filter(fn x -> x != "" end)
      |> Enum.count
    IO.inspect count #mostra a quantidade de palavras no terminal;
  end

end
