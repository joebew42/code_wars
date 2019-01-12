defmodule RomanNumeralsTest do
  use ExUnit.Case, async: true

  @doc """
  Create a function taking a positive integer as its parameter and returning a string containing
  the Roman Numeral representation of that integer.

  Modern Roman numerals are written by expressing each digit separately starting with the left
  most digit and skipping any digit with a value of zero. In Roman numerals 1990 is rendered:
  1000=M, 900=CM, 90=XC; resulting in MCMXC. 2008 is written as 2000=MM, 8=VIII; or MMVIII. 1666
  uses each Roman symbol in descending order: MDCLXVI.

  Example:

  solution(1000) # should return "M"
  Help:

  Symbol    Value
  I          1
  V          5
  X          10
  L          50
  C          100
  D          500
  M          1,000
  Remember that there can't be more than 3 identical symbols in a row.
  """

  test "roman numerals" do
    for {integer, roman} <- [
          {1, "I"},
          {2, "II"},
          {3, "III"},
          {4, "IV"},
          {5, "V"},
          {6, "VI"},
          {7, "VII"},
          {8, "VIII"},
          {9, "IX"},
          {10, "X"},
          {11, "XI"},
          {12, "XII"},
          {13, "XIII"},
          {14, "XIV"},
          {15, "XV"},
          {16, "XVI"},
          {17, "XVII"},
          {18, "XVIII"},
          {19, "XIX"},
          {20, "XX"},
          {1990, "MCMXC"},
          {1999, "MCMXCIX"},
          {2008, "MMVIII"},
          {1666, "MDCLXVI"}
        ],
        do: assert(to_roman(integer) == roman)
  end

  def to_roman(number), do: to_roman(number, "")

  def to_roman(0, acc), do: acc

  def to_roman(number, acc) when number >= 1000 do
    to_roman(rem(number, 1000), acc <> String.duplicate("M", div(number, 1000)))
  end

  def to_roman(number, acc) when number >= 900 do
    to_roman(rem(number, 900), acc <> "CM")
  end

  def to_roman(number, acc) when number >= 500 do
    to_roman(rem(number, 500), acc <> String.duplicate("D", div(number, 500)))
  end

  def to_roman(number, acc) when number >= 100 do
    to_roman(rem(number, 100), acc <> String.duplicate("C", div(number, 100)))
  end

  def to_roman(number, acc) when number >= 90 do
    to_roman(rem(number, 90), acc <> "XC")
  end

  def to_roman(number, acc) when number >= 50 do
    to_roman(rem(number, 50), acc <> String.duplicate("L", div(number, 50)))
  end

  def to_roman(number, acc) when number >= 10 do
    to_roman(rem(number, 10), acc <> String.duplicate("X", div(number, 10)))
  end

  def to_roman(9, acc) do
    to_roman(0, acc <> "IX")
  end

  def to_roman(number, acc) when number >= 5 do
    to_roman(rem(number, 5), acc <> String.duplicate("V", div(number, 5)))
  end

  def to_roman(4, acc) do
    to_roman(0, acc <> "IV")
  end

  def to_roman(number, acc) when number < 4 do
    to_roman(0, acc <> String.duplicate("I", div(number, 1)))
  end
end
