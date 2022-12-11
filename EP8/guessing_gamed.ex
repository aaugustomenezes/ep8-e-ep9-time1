
defmodule GuessingGame do
  @moduledoc"""
  Módulo com funções que implementam um jogo de advinhação de um
  número dado um intervalo.
  """



  @doc"""
  tenta advinhar qual o número que o usuario está pensando dentro
  de um intervalo.

  ## Parametros:

    low: valor mínimo do intervalo
    high: valor maximo do intervalo

  ## Exemplo:

    >GuessingGame.guess(0,100)
    Hmm.. o seu numero é o 50?
    > maior
    Hmm.. o seu numero é o 75?
    ...

  """
  def guess(low,high) do
    answer = IO.gets("Hmm.. o seu numero é o #{mid(low,high)}?\n")
    case String.trim(answer) do
      "maior" ->
        bigger(low,high)
      "menor" ->
        smaller(low,high)
      "sim" ->
        "Acertei!!!"
      _ ->
        IO.puts(~s{inputs aceitos: ("maior", "menor" e "sim")})
        guess(low,high)
    end
  end

  @doc"""
  retorna o valor médio de um dado intervalo

  ## Parametros:

    low: valor mínimo do intervalo
    high: valor maximo do intervalo

  ## Exemplo:

    iex> GuessingGame.mid(0,100)
    50
  """
  def mid(low,high) do
    div(low+high,2)
  end


  @doc"""
  mudar o novo valor minimo para o valor medio do intervalo
  e chama a função guess.

  ## Parametros:

    low: valor mínimo do intervalo
    high: valor maximo do intervalo

  ## Exemplo:

    > GuessingGame.bigger(0,100)
    Hmm.. o seu numero é o 75?

  """
  def bigger(low,high) do
    new_low = min(high, mid(low,high) + 1)
    guess(new_low,high)
  end


  @doc"""
  mudar o novo valor máximo para o valor médio do intervalo
  e chama a função guess.

  ## Parametros:

    low: valor mínimo do intervalo
    high: valor maximo do intervalo

  ## Exemplo:

    > GuessingGame.smaller(0,100)
    Hmm.. o seu numero é o 25?

  """
  def smaller(low,high) do
    new_high = max(low, mid(low,high) - 1)
    guess(low,new_high)
  end

end
