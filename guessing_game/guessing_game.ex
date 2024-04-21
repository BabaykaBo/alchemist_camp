defmodule GuessingGame do
  @moduledoc """
  guess between  low and high numbers - guess middle value
  """

  def guess(low, high) do
    IO.puts(low)
    IO.puts(high)
  end

  def mid(low, high) do
    div(low + high, 2)
  end

  def bigger(low, high) do
    mid(low, high)
    |> Kernel.+(1)
    |> min(high)
    |> guess(high)
  end

  def smaller(low, high) do
    mid(low, high)
    |> Kernel.-(1)
    |> max(low)
    |> then(&guess(low, &1))
  end
end
