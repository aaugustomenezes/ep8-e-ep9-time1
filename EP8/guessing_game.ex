# Guessing Game

defmodule Guess do
  @moduledoc """
  Define uma função main e outras funções acessórias para advinhar um número na cabeça do usuário através de chutes e feedback negativo;
  """

  @doc """
  define a função principal que inicia as perguntas. Chama a função compare que inicia os chutes da máquina;
  """

  def main do

    input = IO.gets("Pick a number between 0 and 100 (type 'ok' to start): ")
    if input === "ok\n" do
      IO.puts("all good. Remember to respond too high, too low or yes only. Else I can't understand\n\n")
      compare()
    end

  end

  @doc """
  Inicia o primeiro chute da máquina entre 1 e 100;
  """

  def compare() do
    number = Enum.random(1..100)
    while10("", number)
  end

  @doc """
  Primeiro loop recursivo que pula o número de 10 em 10 dependendo das respostas. Se uma resposta 'too high' é seguida de um 'too low', entra-se no loop que pula de 5 em 5 para mais;
  Caso 'too low' seja seguido de 'too high', entra-se no loop de 5 em 5 para menos.
  Caso duas respostas consecutivas sejam iguais, continua-se no mesmo ciclo.
  """

  def while10(last_response, number) do
    response = IO.gets("Is your number #{number}?: ")
    if response === last_response or last_response === ""  do
      cond do
        response === "too high\n" -> while10(response, number-10)
        response === "too low\n" -> while10(response, number+10)
      end
    else
      cond do
          response === "yes\n" -> IO.puts("I got you :)")
          response === "too high\n" -> while5(response, number-5)
          response === "too low\n" -> while5(response, number+5)
      end
    end
  end

  @doc """
  Primeiro loop recursivo que pula o número de 5 em 5 dependendo das respostas. Se uma resposta 'too high' é seguida de um 'too low', entra-se no loop que pula de 1 em 1 para mais;
  Caso 'too low' seja seguido de 'too high', entra-se no loop de 1 em 1 para menos.
  Caso duas respostas consecutivas sejam iguais, continua-se no mesmo ciclo.
  """

  def while5(last_response, number) do
    response = IO.gets("Is your number #{number}?: ")
    if response === last_response do
      cond do
        response === "too high\n" -> while5(response, number-5)
        response === "too low\n" -> while5(response, number+5)
      end
    else
      cond do
          response === "yes\n" -> IO.puts("I got you :)")
          response === "too high\n" -> while1(response, number-1)
          response === "too low\n" -> while1(response, number+1)
      end
    end
  end

  @doc """
  Ciclo de maior precisão. Vai de 1 em 1 até acertar o número do jogador. 
  """

  def while1(last_response, number) do
    response = IO.gets("Is your number #{number}?: ")
    if response === last_response do
      cond do
        response === "too high\n" -> while1(response, number-1)
        response === "too low\n" -> while1(response, number+1)
      end
    else
      if response === "yes\n" do
        IO.puts("I got you :)")
      end
    end
  end  
  
end