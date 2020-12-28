defmodule Cartographers.Utilities.ListRotationsTest do
  use ExUnit.Case
  import Cartographers.Utilities.ListRotations

  test "test ListRotations.rotate_left/1" do
    assert rotate_left([]) == []
    assert rotate_left([[1, 2, 3]]) == [[3], [2], [1]]
    assert rotate_left([[1, 2], [3, 4]]) == [[2, 4], [1, 3]]
    assert rotate_left([[1, 2], [3, 4], [5, 6]]) == [[2, 4, 6], [1, 3, 5]]
  end

  test "test ListRotations.rotate_right/1" do
    assert rotate_right([]) == []
    assert rotate_right([[1, 2, 3]]) == [[1], [2], [3]]
    assert rotate_right([[1, 2], [3, 4]]) == [[3, 1], [4, 2]]
    assert rotate_right([[1, 2], [3, 4], [5, 6]]) == [[5, 3, 1], [6, 4, 2]]
  end
end
