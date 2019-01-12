defmodule StringEndWithTest do
  use ExUnit.Case, async: true

  @doc """
  Complete the solution so that it returns true if the first argument(string) passed in ends with
  the 2nd argument (also a string).

  Examples:

  solution("abc", "bc") # returns true
  solution("abc", "d") # returns false
  """

  test "string_ends_with?" do
    assert string_ends_with?("abc", "bc")
    assert string_ends_with?("abc", "abc")
    refute string_ends_with?("abc", "d")
    refute string_ends_with?("abc", "ac")
    refute string_ends_with?("abc", "abcd")
    refute string_ends_with?("abc", "dabc")
    refute string_ends_with?("abc", "deabc")
  end

  def string_ends_with?(string, ends_with) do
    string_ends_with?(
      string |> to_charlist() |> Enum.reverse(),
      ends_with |> to_charlist() |> Enum.reverse(),
      true
    )
  end

  def string_ends_with?([], [_h | _t], _), do: false
  def string_ends_with?(_, [], result), do: result
  def string_ends_with?([h1 | t1], [h2 | t2], _result) do
    string_ends_with?(t1, t2, h1 == h2)
  end
end
