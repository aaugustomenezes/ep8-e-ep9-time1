# Guessing Game

defmodule Guess do
  def main do

    input = IO.gets("Pick a number between 0 and 100 (type 'ok' to start): ")
    if input === "ok\n" do
      IO.puts("all good. Remember to respond too high, too low or yes only. Else I can't understand\n\n")
      compare()
    end

  end

  def compare() do
    number = Enum.random(1..100)
    while10("", number)
  end

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