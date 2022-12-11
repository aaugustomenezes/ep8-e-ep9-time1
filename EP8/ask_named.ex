# Ask Name

defmodule AskName do
  @moduledoc"""
  Módulo com uma função chamada ask_name que cumprimenta o usuario
  """

  @doc"""
  lê o nome do usuário e printa uma mensagem o cumprimentando.

  ## Parametros: Nenhum

  ## Exemplo:

    AskName.ask_name
    Ola, usuario! Qual é o seu nome?
    Joao
    Ola, Joao, um prazer lhe conhecer!

  """
  def ask_name do
    name = IO.gets("Olá, usuário! Qual é o seu nome?\n")
    case String.trim(name) do
      "Enzo" -> "Olá, Enzo, prazer! Fui programado por uma pessoa com esse nome!"
      name -> "Olá, #{name}, um prazer lhe conhecer!"
    end
  end
end
