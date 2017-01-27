defmodule Bob do
  def hey(input) do
    cond do
      Regex.match?(~r/\?$/, input) ->
        "Sure."
      Regex.match?(~r/([[:upper:]]+)([^[:lower:]]+)/, input) ->
        "Whoa, chill out!"
      Regex.match?(~r/^\s*$/, input) ->
        "Fine. Be that way!"
      true ->
        "Whatever."
    end
  end
end
