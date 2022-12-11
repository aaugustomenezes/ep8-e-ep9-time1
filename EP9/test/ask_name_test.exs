

defmodule AskNameTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  doctest AskName

  test "greeting message returns ok" do
    assert capture_io("joao",
      fn -> IO.write AskName.ask_name end) == "Olá, usuário! Qual é o seu nome?\nOlá, joao, um prazer lhe conhecer!"
  end

  test "special greeting message returns ok" do
    assert capture_io("Enzo",
      fn -> IO.write AskName.ask_name end) == "Olá, usuário! Qual é o seu nome?\nOlá, Enzo, prazer! Fui programado por uma pessoa com esse nome!"
  end

end
