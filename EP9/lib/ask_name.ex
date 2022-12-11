# Ask Name

defmodule AskName do
  def ask_name do
    name = IO.gets("Olá, usuário! Qual é o seu nome?\n")
    case String.trim(name) do
      "Enzo" -> "Olá, Enzo, prazer! Fui programado por uma pessoa com esse nome!"
      name -> "Olá, #{name}, um prazer lhe conhecer!"
    end
  end
end
