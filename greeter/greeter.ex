defmodule Greeter do
  @moduledoc """
  Module for greeting
  """

  @doc """
  Function for greeting
  """
  @spec greet(name :: String.t()) :: :ok
  def greet(name \\ "") do
    str = name |> String.trim() |> String.capitalize()

    case str do
      "" -> "Hi, anonymous guy :)"
      "Oleh" -> "I am glad to see you, Oleh!"
      _ -> "Hello, #{str}!"
    end
  end
end
