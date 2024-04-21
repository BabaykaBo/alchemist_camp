defmodule GuessingGame do
  @moduledoc """
  guess between  low and high numbers - guess middle value
  """

  @doc """
  start guessing number
  """
  @spec guess(integer(), integer()) :: :ok
  def guess(low, high) when low > high, do: guess(high, low)

  def guess(low, high) do
    response = IO.gets("Hmm... Maybe you're thinking about #{mid(low, high)}?\n")

    case String.trim(response) do
      "bigger" ->
        bigger(low, high)

      "smaller" ->
        smaller(low, high)

      "yes" ->
        "I knew that I've guessed your number!"

      _ ->
        IO.puts(~s(Type "bigger", "smaller", "yes"))
        guess(low, high)
    end
  end

  @spec mid(integer(), integer()) :: integer()
  defp mid(low, high) do
    div(low + high, 2)
  end

  @spec bigger(integer(), integer()) :: :ok
  defp bigger(low, high) do
    mid(low, high)
    |> Kernel.+(1)
    |> min(high)
    |> guess(high)
  end

  @spec smaller(integer(), integer()) :: :ok
  defp smaller(low, high) do
    mid(low, high)
    |> Kernel.-(1)
    |> max(low)
    |> then(&guess(low, &1))
  end
end
