defmodule Cartographers.Utilities.ListRotations do
  # TODO: Optimize those algoritms to use tail recursion

  @doc """
  Rotates a given list to the left (clockwise)
  For example, given a list that looks like:
  [
    [1, 2, 3],
    [4, 5, 6]
  ]

  the output would be:
  [
    [3, 6],
    [2, 5],
    [1, 4]
  ]

  """
  def rotate_left([]), do: []
  def rotate_left(list) when is_list(list) do
    base = list |> Enum.map(&List.last/1)
    rest = list |> Enum.map(&Enum.drop(&1, -1))

    if List.first(rest) == [],
      do: [base],
      else: [base] ++ rotate_left(rest)
  end
  def rotate_left(_), do: raise ArgumentError

  @doc """
  Rotates a given list to the right (clockwise)
  For example, given a list that looks like:
  [
    [1, 2, 3],
    [4, 5, 6]
  ]

  the output would be:
  [
    [4, 1],
    [5, 2],
    [6, 3]
  ]

  """
  def rotate_right([]), do: []
  def rotate_right(list) when is_list(list) do
    base = list |> Enum.map(&List.first/1)
    rest = list |> Enum.map(&Enum.drop(&1, 1))

    if List.last(rest) == [],
      do: [Enum.reverse(base)],
      else: [Enum.reverse(base)] ++ rotate_right(rest)
  end
  def rotate_right(_), do: raise ArgumentError
end
