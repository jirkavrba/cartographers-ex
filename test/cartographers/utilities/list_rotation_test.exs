defmodule Cartographers.Utilities.ListRotationsTest do
  use ExUnit.Case
  import Cartographers.Utilities.ListRotations

  test "test ListRotations.left_rotation/1" do
    assert rotate_left([]) == []
    assert rotate_left([[1, 2, 3]]) == [[1], [2], [3]]
    assert rotate_left([[1, 2], [3, 4]]) == [[3, 1], [4, 2]]
    assert rotate_left([[1, 2], [3, 4], [5, 6]]) == [[5, 3, 1], [6, 4, 2]]
  end

  test "test ListRotations.right_rotation/1" do
    assert rotate_left([]) == []
    assert rotate_left([[1, 2, 3]]) == [[3], [2], [1]]
    assert rotate_left([[1, 2], [3, 4]]) == [[1, 4], [1, 3]]
    assert rotate_left([[1, 2], [3, 4], [5, 6]]) == [[5, 3, 1], [6, 4, 2]]
  end
end
