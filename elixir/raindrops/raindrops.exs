defmodule Raindrops do
  @factors %{3 => "Pling", 5 => "Plang", 7 => "Plong"}

  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """
  @spec convert(pos_integer) :: String.t
  def convert(number) do
    converted = do_convert(number)

    if String.length(converted) === 0 do
      Integer.to_string(number)
    else
      converted
    end
  end

  defp do_convert(number) do
    Enum.reduce Map.keys(@factors), "", fn(x, acc) ->
      cond do
        rem(number, x) === 0 ->
          acc <> Map.get(@factors, x)
        true ->
          acc
      end
    end
  end
end
