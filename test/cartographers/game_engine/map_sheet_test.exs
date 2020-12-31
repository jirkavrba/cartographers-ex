defmodule Cartographers.GameEngine.MapSheetTest do
  use ExUnit.Case
  alias Cartographers.GameEngine.MapSheet
  alias Cartographers.GameEngine.MapSheet.Position
  alias Cartographers.GameEngine.MapSheet.Tile

  test "In bounds detection with position" do
    assert MapSheet.in_bounds?(%Position{x: 1, y: 1}) == true
    assert MapSheet.in_bounds?(%Position{x: 10, y: 10}) == true
    assert MapSheet.in_bounds?(%Position{x: 0, y: 0}) == true
    assert MapSheet.in_bounds?(%Position{x: 11, y: 1}) == false
    assert MapSheet.in_bounds?(%Position{x: 1, y: 11}) == false
    assert MapSheet.in_bounds?(%Position{x: 11, y: 11}) == false
  end

  defp make_tile(x, y, material), do: %Tile{position: %Position{x: x, y: y}, material: material}

  test "In bounds detection with Tile" do
    assert MapSheet.in_bounds?(make_tile(1, 1, :empty)) == true
    assert MapSheet.in_bounds?(make_tile(10, 10, :mountain)) == true
    assert MapSheet.in_bounds?(make_tile(0, 0, :village)) == true
    assert MapSheet.in_bounds?(make_tile(11, 1, :water)) == false
    assert MapSheet.in_bounds?(make_tile(1, 11, :forest)) == false
    assert MapSheet.in_bounds?(make_tile(11, 11, :monster)) == false
  end

  test "Empty map sheet creation with MapSheet.empty/0" do
    empty = MapSheet.empty

    for x <- 0 .. 10, y <- 0 .. 10 do
      assert MapSheet.tile_at(empty, %Position{x: x, y: y}).material == :empty
    end
  end
end
