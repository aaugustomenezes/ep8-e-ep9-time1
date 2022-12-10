# todo

defmodule Todo do

  @moduledoc """
  define funções para administrar uma lista 'todo'.
  """

  @doc """
  A função start inicia o módulo com a leitura e parsing do arquivo da lista csv. Inicia o menu para o usuário;
  """

  def start do

    filename = IO.gets('arquivo csv: ') |> String.trim
    read(filename)
      |> parse
      |> get_command
  end

  @doc """
  O menu para o usuário, que poderá escolher entre exibir a lista, deletar elementos da lista, e fechar o app;

  ### Parametros: 
    Recebe o array construído pela leitura do arquivo csv;
  """

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

  @doc """
  Função para deletar elementos da lista. Caso o elemento digitado não seja encontrado na lista, retorna mensagem de erro.

  ### Parametros: 
    Recebe o array construído pela leitura do arquivo csv;
  """

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

  @doc """
  Função para leitura do arquivo, chamada na função 'start';
  Retorna erro caso a leitura não seja possível;

  ### Parametros: 
    Recebe uma string com o nome do arquivo csv a ser lido.
  """

  def read(filename) do

    case File.read(filename) do
      {:ok,body}       -> body
      {:error,_reason} -> IO.puts ~s(Could not open file "#{filename}" .\n)
                          start()
    end
  end

  @doc """
  Função para parsing do arquivo csv. É chamada na função start do programa. Aqui é separado o título do corpo do arquivo.

  ### Parametros: 
    Recebe uma string obtida pela leitura do arquivo csv na função 'read';
  """

  def parse(body) do

    [header | lines] = String.split(body, ~r{(\r\n|\r|\n)})
    titles = tl String.split(header,",")
    parse_lines(lines,titles)
  end

  @doc """
  Função para parsing do arquivo csv. Faz parsing do corpo do arquivo.

  ### Parametros: 
    Recebe um array com as linhas do arquivo;
  """

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

  @doc """
  Função para exibir as tarefas da lista. Pode ser chamada do menu 'get_command(data)'

  ### Parametros: 
    Recebe o array construído pela leitura do arquivo csv;
  """

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
