defmodule SumOfMultiples do
  @doc """
  Adds up all numbers from 1 to a given end number that are multiples of the factors provided.
  """
  @spec to(non_neg_integer, [non_neg_integer]) :: non_neg_integer
  def to(limit, factors) do
    range = 1..limit - 1

    range
    |> take_multiples(factors)
    |> Enum.sum
  end

  defp take_multiples(numbers, factors) do
    Enum.filter numbers, fn number ->
      is_multiple(number, factors)
    end
  end

  defp is_multiple(number, factors) do
    Enum.any? factors, fn factor ->
      rem(number, factor) === 0
    end
  end
end
