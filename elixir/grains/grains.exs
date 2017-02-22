defmodule Grains do
  @doc """
  Calculate two to the power of the input minus one.
  """
  @spec square(pos_integer) :: pos_integer
  def square(number) do
    if number in 1..64 do
      {:ok, :math.pow(2, number - 1) |> round}
    else
      {:error, "The requested square must be between 1 and 64 (inclusive)"}
    end
  end

  @doc """
  Adds square of each number from 1 to 64.
  """
  @spec total :: pos_integer
  def total do
    Enum.reduce_while 1..64, {:ok, 0}, fn(x, {_, acc}) ->
      case square(x) do
        {:ok, squared} ->
          {:cont, {:ok, acc + squared}}
        error ->
          {:halt, error}
      end
    end
  end
end
