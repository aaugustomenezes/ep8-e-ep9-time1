# todo

defmodule Todo do
  def start do

    filename = IO.gets('arquivo csv: ') |> String.trim
    read(filename)
      |> parse
      |> get_command
  end

  def get_command(data) do

    command = IO.gets("digite o comando: ")
      |> String.trim
      |> String.downcase

    case command do
      "r" -> show_todos(data)
      "d" -> delete_todo(data)
      "q" -> "ENCERRANDO APP!"
       _  -> get_command(data)
    end
  end

  def delete_todo(data) do

    todo = IO.gets("qual tarefa voce quer remover?\n") |> String.trim
    if Map.has_key? data, todo do
      IO.puts "ok"
      new_map = Map.drop(data,[todo])
      IO.puts ~s("#{todo}" foi removido com sucesso.)
      get_command(new_map)
    else
      IO.puts ~s(nao existe um tarefa chamada "#{todo}"!)
      show_todos(data,false)
      delete_todo(data)
    end
  end

  def read(filename) do

    case File.read(filename) do
      {:ok,body}       -> body
      {:error,_reason} -> IO.puts ~s(Could not open file "#{filename}" .\n)
                          start()
    end
  end

  def parse(body) do

    [header | lines] = String.split(body, ~r{(\r\n|\r|\n)})
    titles = tl String.split(header,",")
    parse_lines(lines,titles)
  end

  def parse_lines(lines,titles) do

    Enum.reduce(lines, %{}, fn line, built ->
      [name | fields] = String.split(line,",")
      if Enum.count(fields) == Enum.count(titles) do
        line_data = Enum.zip(titles,fields) |> Enum.into(%{})
        Map.merge(built,%{name => line_data})
      else
        built
      end
    end)
  end

  def show_todos(data,next_command? \\ true) do

    items = Map.keys data
    IO.puts "Estas sao suas tarefas pendentes: \n"
    Enum.each items, fn item -> IO.puts item end
    IO.puts "\n"
    if next_command? do
      get_command(data)
    end
  end

end
