#- wc: conta palavras, com a mesma funcionalidade do "wc" do linux.

defmodule WordCount do
  @moduledoc"""
  Módulo com uma função chamada count que conta a quantidade de linhas de
  um documento.
  """

  @doc"""
  Conta a quantidade de linhas de um documento dado pelo usuário.

  ## Parametros: Nenhum (o nome do arquivo é dado pelo usuário pelo IO)

  ## Exemplo:

    iex> WordCount.count
    nome do arquivo: umtexto.txt
    54

  """
  def count do

    filename = IO.gets("nome do arquivo: ") |> String.trim
    body = File.read! filename
    count =
      String.split(body, ~r{\\n|[^\w]+})
      |> Enum.filter(fn x -> x != "" end)
      |> Enum.count
    IO.inspect count

  end

end
