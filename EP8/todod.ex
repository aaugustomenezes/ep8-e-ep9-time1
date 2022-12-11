
defmodule Todo do
  @moduledoc"""
  Módulo com funções que implementam a lista de afazeres,a aplicação
  permite ler um arquivo csv com as tarefas e remover tarefas selecionadas
  pelo nome.
  """


  @doc"""
  lê o arquivo csv inserido pelo usuário, printa as atividades na tela e
  permite a manipulação das tarefas através da função get_command.

  ## Parametros: Nenhum

  ## Exemplo:

    iex> Todo.start
    arquivo csv: todo.csv
    digite o comando:

  """
  def start do
    filename = IO.gets('arquivo csv: ') |> String.trim
    read(filename)
      |> parse
      |> get_command
  end



  @doc"""
  executa comandos diferentes na list ade afazeres baseado no input do usuário.

    comandos:

        'r' : mostra todos os afazeres listados
        'd' : remove um afazer da lista dado o seu nome
        'q' : encerra a aplicação.

  ## Parametros:

      data : recebe a lista de afazeres

  ## Exemplo:

    iex>get_command(data)
    iex>digite o comando: r
        Estas sao suas tarefas pendentes:

        Fazer atividade EP6
        Fazer atividade EP7
        Mandar mensagem no grupo
        Pesquisar no Alchemist

    iex>digite o comando: d
        qual tarefa voce quer remover?
        Fazer atividade EP6
        ok
        'Fazer atividade EP6' foi removido com sucesso.

    iex>digite o comando: r
        Estas sao suas tarefas pendentes:

        Fazer atividade EP7
        Mandar mensagem no grupo
        Pesquisar no Alchemist

    iex>digite o comando: q
    'ENCERRANDO APP!'

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


  @doc"""
  remove uma tarefa da lista de tarefas.

  ## Parametros:

      data : recebe a lista de afazeres

  ## Exemplo:

    iex> Todo.delete_todo(data)
    qual tarefa voce quer remover?
    Pesquisar no Alchemist
    ok
    Pesquisar no Alchemist foi removido com sucesso.

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


  @doc"""
  lê o arquivo csv

  ## Parametros:

    filename: nome do arquivo a ser lido

  ## Exemplo:

    iex> Todo.read(todo.csv)

  """
  def read(filename) do
    case File.read(filename) do
      {:ok,body}       -> body
      {:error,_reason} -> IO.puts ~s(Could not open file "#{filename}" .\n)
                          start()
    end
  end


  @doc"""
  processa o texto retirado do arquivo csv e transforma no
  formato de lista de prioridades.

  ## Parametros:

    body: texto não processado do arquivo csv

  ## Exemplo:

    iex> Todo.parse(data)
      %{
        "Fazer atividade EP6" => %{
          "Comentários" => "EP6 é trabalhoso",
          "Prioridade" => "9"
        },
        "Fazer atividade EP7" => %{
          "Comentários" => "Entrega no feriado",
          "Prioridade" => "8"
        },
        "Mandar mensagem no grupo" => %{
          "Comentários" => "Consegui fazer a atividade",
          "Prioridade" => "9"
        },
        "Pesquisar no Alchemist" => %{
          "Comentários" => "Exemplos explicados",
          "Prioridade" => "10"
        }
      }



  """
  def parse(body) do
    [header | lines] = String.split(body, ~r{(\r\n|\r|\n)})
    titles = tl String.split(header,",")
    parse_lines(lines,titles)
  end


  @doc"""
  lê a string da atividade e a transforma no formato de
  afazer.

  ## Parametros:

  ## Exemplo:

    iex> Todo.parse_lines('Pesquisar no alchemist')

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


  @doc"""
  printa no terminal todas as atividades da lista de afazeres.

  ## Parametros:

    data : recebe a lista de afazeres

  ## Exemplo:

    iex> Todo.show_todos(data)
      Estas sao suas tarefas pendentes:

      Fazer atividade EP6
      Fazer atividade EP7
      Mandar mensagem no grupo
      Pesquisar no Alchemist



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
