
defmodule GuessingGame do

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

  def mid(low,high) do
    div(low+high,2)
  end

  def bigger(low,high) do
    new_low = min(high, mid(low,high) + 1)
    guess(new_low,high)
  end

  def smaller(low,high) do
    new_high = max(low, mid(low,high) - 1)
    guess(low,new_high)
  end

end
