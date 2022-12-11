

defmodule GuessingGameTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  doctest GuessingGame

  test "mid returns average" do
    assert GuessingGame.mid(0,100) == 50
  end

  test "bigger returns guess loop with new low" do
    assert capture_io("sim", fn -> IO.write GuessingGame.bigger(0,100) end) == "Hmm.. o seu numero é o 75?\nAcertei!!!"
  end

  test "smaller returns guess loop with new high" do
    assert capture_io("sim", fn -> IO.write GuessingGame.smaller(0,100) end) == "Hmm.. o seu numero é o 24?\nAcertei!!!"
  end

  test "guess" do
    assert capture_io("sim", fn -> IO.write GuessingGame.guess(0,100) end) == "Hmm.. o seu numero é o 50?\nAcertei!!!"
  end

end
