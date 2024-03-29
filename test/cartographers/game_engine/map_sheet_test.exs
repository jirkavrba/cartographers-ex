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

  test "MapSheet.make of an empty map" do
    assert MapSheet.make([
    "eeeeeeeeeee",
    "eeeeeeeeeee",
    "eeeeeeeeeee",
    "eeeeeeeeeee",
    "eeeeeeeeeee",
    "eeeeeeeeeee",
    "eeeeeeeeeee",
    "eeeeeeeeeee",
    "eeeeeeeeeee",
    "eeeeeeeeeee",
    "eeeeeeeeeee",
    ]) == MapSheet.empty

    assert MapSheet.make([
    "eeeeeeeeeee",
    "eeeeeeeeeee",
    "eeeeeeeeeee",
    "eweeeweFFee",
    "eeweweeFeFe",
    "eeeweeeFeFe",
    "eeweweeFeFe",
    "eweeeweFFee",
    "eeeeeeeeeee",
    "eeeeeeeeeee",
    "eeeeeeeeeee",
    ]) == %MapSheet{
      tiles: [
    [%Tile{material: :empty, position: %Position{x: 0, y: 0}}, %Tile{material: :empty, position: %Position{x: 0, y: 1}}, %Tile{material: :empty, position: %Position{x: 0, y: 2}}, %Tile{material: :empty, position: %Position{x: 0, y: 3}}, %Tile{material: :empty, position: %Position{x: 0, y: 4}}, %Tile{material: :empty, position: %Position{x: 0, y: 5}}, %Tile{material: :empty, position: %Position{x: 0, y: 6}}, %Tile{material: :empty, position: %Position{x: 0, y: 7}}, %Tile{material: :empty, position: %Position{x: 0, y: 8}}, %Tile{material: :empty, position: %Position{x: 0, y: 9}}, %Tile{material: :empty, position: %Position{x: 0, y: 10}}],
    [%Tile{material: :empty, position: %Position{x: 1, y: 0}}, %Tile{material: :empty, position: %Position{x: 1, y: 1}}, %Tile{material: :empty, position: %Position{x: 1, y: 2}}, %Tile{material: :empty, position: %Position{x: 1, y: 3}}, %Tile{material: :empty, position: %Position{x: 1, y: 4}}, %Tile{material: :empty, position: %Position{x: 1, y: 5}}, %Tile{material: :empty, position: %Position{x: 1, y: 6}}, %Tile{material: :empty, position: %Position{x: 1, y: 7}}, %Tile{material: :empty, position: %Position{x: 1, y: 8}}, %Tile{material: :empty, position: %Position{x: 1, y: 9}}, %Tile{material: :empty, position: %Position{x: 1, y: 10}}],
    [%Tile{material: :empty, position: %Position{x: 2, y: 0}}, %Tile{material: :empty, position: %Position{x: 2, y: 1}}, %Tile{material: :empty, position: %Position{x: 2, y: 2}}, %Tile{material: :empty, position: %Position{x: 2, y: 3}}, %Tile{material: :empty, position: %Position{x: 2, y: 4}}, %Tile{material: :empty, position: %Position{x: 2, y: 5}}, %Tile{material: :empty, position: %Position{x: 2, y: 6}}, %Tile{material: :empty, position: %Position{x: 2, y: 7}}, %Tile{material: :empty, position: %Position{x: 2, y: 8}}, %Tile{material: :empty, position: %Position{x: 2, y: 9}}, %Tile{material: :empty, position: %Position{x: 2, y: 10}}],
    [%Tile{material: :empty, position: %Position{x: 3, y: 0}}, %Tile{material: :water, position: %Position{x: 3, y: 1}}, %Tile{material: :empty, position: %Position{x: 3, y: 2}}, %Tile{material: :empty, position: %Position{x: 3, y: 3}}, %Tile{material: :empty, position: %Position{x: 3, y: 4}}, %Tile{material: :water, position: %Position{x: 3, y: 5}}, %Tile{material: :empty, position: %Position{x: 3, y: 6}}, %Tile{material: :farm, position: %Position{x: 3, y: 7}}, %Tile{material: :farm, position: %Position{x: 3, y: 8}}, %Tile{material: :empty, position: %Position{x: 3, y: 9}}, %Tile{material: :empty, position: %Position{x: 3, y: 10}}],
    [%Tile{material: :empty, position: %Position{x: 4, y: 0}}, %Tile{material: :empty, position: %Position{x: 4, y: 1}}, %Tile{material: :water, position: %Position{x: 4, y: 2}}, %Tile{material: :empty, position: %Position{x: 4, y: 3}}, %Tile{material: :water, position: %Position{x: 4, y: 4}}, %Tile{material: :empty, position: %Position{x: 4, y: 5}}, %Tile{material: :empty, position: %Position{x: 4, y: 6}}, %Tile{material: :farm, position: %Position{x: 4, y: 7}}, %Tile{material: :empty, position: %Position{x: 4, y: 8}}, %Tile{material: :farm, position: %Position{x: 4, y: 9}}, %Tile{material: :empty, position: %Position{x: 4, y: 10}}],
    [%Tile{material: :empty, position: %Position{x: 5, y: 0}}, %Tile{material: :empty, position: %Position{x: 5, y: 1}}, %Tile{material: :empty, position: %Position{x: 5, y: 2}}, %Tile{material: :water, position: %Position{x: 5, y: 3}}, %Tile{material: :empty, position: %Position{x: 5, y: 4}}, %Tile{material: :empty, position: %Position{x: 5, y: 5}}, %Tile{material: :empty, position: %Position{x: 5, y: 6}}, %Tile{material: :farm, position: %Position{x: 5, y: 7}}, %Tile{material: :empty, position: %Position{x: 5, y: 8}}, %Tile{material: :farm, position: %Position{x: 5, y: 9}}, %Tile{material: :empty, position: %Position{x: 5, y: 10}}],
    [%Tile{material: :empty, position: %Position{x: 6, y: 0}}, %Tile{material: :empty, position: %Position{x: 6, y: 1}}, %Tile{material: :water, position: %Position{x: 6, y: 2}}, %Tile{material: :empty, position: %Position{x: 6, y: 3}}, %Tile{material: :water, position: %Position{x: 6, y: 4}}, %Tile{material: :empty, position: %Position{x: 6, y: 5}}, %Tile{material: :empty, position: %Position{x: 6, y: 6}}, %Tile{material: :farm, position: %Position{x: 6, y: 7}}, %Tile{material: :empty, position: %Position{x: 6, y: 8}}, %Tile{material: :farm, position: %Position{x: 6, y: 9}}, %Tile{material: :empty, position: %Position{x: 6, y: 10}}],
    [%Tile{material: :empty, position: %Position{x: 7, y: 0}}, %Tile{material: :water, position: %Position{x: 7, y: 1}}, %Tile{material: :empty, position: %Position{x: 7, y: 2}}, %Tile{material: :empty, position: %Position{x: 7, y: 3}}, %Tile{material: :empty, position: %Position{x: 7, y: 4}}, %Tile{material: :water, position: %Position{x: 7, y: 5}}, %Tile{material: :empty, position: %Position{x: 7, y: 6}}, %Tile{material: :farm, position: %Position{x: 7, y: 7}}, %Tile{material: :farm, position: %Position{x: 7, y: 8}}, %Tile{material: :empty, position: %Position{x: 7, y: 9}}, %Tile{material: :empty, position: %Position{x: 7, y: 10}}],
    [%Tile{material: :empty, position: %Position{x: 8, y: 0}}, %Tile{material: :empty, position: %Position{x: 8, y: 1}}, %Tile{material: :empty, position: %Position{x: 8, y: 2}}, %Tile{material: :empty, position: %Position{x: 8, y: 3}}, %Tile{material: :empty, position: %Position{x: 8, y: 4}}, %Tile{material: :empty, position: %Position{x: 8, y: 5}}, %Tile{material: :empty, position: %Position{x: 8, y: 6}}, %Tile{material: :empty, position: %Position{x: 8, y: 7}}, %Tile{material: :empty, position: %Position{x: 8, y: 8}}, %Tile{material: :empty, position: %Position{x: 8, y: 9}}, %Tile{material: :empty, position: %Position{x: 8, y: 10}}],
    [%Tile{material: :empty, position: %Position{x: 9, y: 0}}, %Tile{material: :empty, position: %Position{x: 9, y: 1}}, %Tile{material: :empty, position: %Position{x: 9, y: 2}}, %Tile{material: :empty, position: %Position{x: 9, y: 3}}, %Tile{material: :empty, position: %Position{x: 9, y: 4}}, %Tile{material: :empty, position: %Position{x: 9, y: 5}}, %Tile{material: :empty, position: %Position{x: 9, y: 6}}, %Tile{material: :empty, position: %Position{x: 9, y: 7}}, %Tile{material: :empty, position: %Position{x: 9, y: 8}}, %Tile{material: :empty, position: %Position{x: 9, y: 9}}, %Tile{material: :empty, position: %Position{x: 9, y: 10}}],
    [%Tile{material: :empty, position: %Position{x: 10, y: 0}}, %Tile{material: :empty, position: %Position{x: 10, y: 1}}, %Tile{material: :empty, position: %Position{x: 10, y: 2}}, %Tile{material: :empty, position: %Position{x: 10, y: 3}}, %Tile{material: :empty, position: %Position{x: 10, y: 4}}, %Tile{material: :empty, position: %Position{x: 10, y: 5}}, %Tile{material: :empty, position: %Position{x: 10, y: 6}}, %Tile{material: :empty, position: %Position{x: 10, y: 7}}, %Tile{material: :empty, position: %Position{x: 10, y: 8}}, %Tile{material: :empty, position: %Position{x: 10, y: 9}}, %Tile{material: :empty, position: %Position{x: 10, y: 10}}]
      ],
      ruins: []
    }

    assert MapSheet.make([
      "eeeeeeeeeee",
      "ewwweveeeFe",
      "eeewevvveFe",
      "eeeeeeeeeFe",
      "eeMMeeffeFe",
      "eeMMeffeeee",
      "eeeeeeeeeee",
      "ememememeee",
      "eeeeeeeeeee",
      "eeeeeeeeeee",
      "eeeeeeeeeee"
    ]) == %MapSheet{
  tiles: [
[%Tile{material: :empty, position: %Position{x: 0, y: 0}}, %Tile{material: :empty, position: %Position{x: 0, y: 1}}, %Tile{material: :empty, position: %Position{x: 0, y: 2}}, %Tile{material: :empty, position: %Position{x: 0, y: 3}}, %Tile{material: :empty, position: %Position{x: 0, y: 4}}, %Tile{material: :empty, position: %Position{x: 0, y: 5}}, %Tile{material: :empty, position: %Position{x: 0, y: 6}}, %Tile{material: :empty, position: %Position{x: 0, y: 7}}, %Tile{material: :empty, position: %Position{x: 0, y: 8}}, %Tile{material: :empty, position: %Position{x: 0, y: 9}}, %Tile{material: :empty, position: %Position{x: 0, y: 10}}],
[%Tile{material: :empty, position: %Position{x: 1, y: 0}}, %Tile{material: :water, position: %Position{x: 1, y: 1}}, %Tile{material: :water, position: %Position{x: 1, y: 2}}, %Tile{material: :water, position: %Position{x: 1, y: 3}}, %Tile{material: :empty, position: %Position{x: 1, y: 4}}, %Tile{material: :village, position: %Position{x: 1, y: 5}}, %Tile{material: :empty, position: %Position{x: 1, y: 6}}, %Tile{material: :empty, position: %Position{x: 1, y: 7}}, %Tile{material: :empty, position: %Position{x: 1, y: 8}}, %Tile{material: :farm, position: %Position{x: 1, y: 9}}, %Tile{material: :empty, position: %Position{x: 1, y: 10}}],
[%Tile{material: :empty, position: %Position{x: 2, y: 0}}, %Tile{material: :empty, position: %Position{x: 2, y: 1}}, %Tile{material: :empty, position: %Position{x: 2, y: 2}}, %Tile{material: :water, position: %Position{x: 2, y: 3}}, %Tile{material: :empty, position: %Position{x: 2, y: 4}}, %Tile{material: :village, position: %Position{x: 2, y: 5}}, %Tile{material: :village, position: %Position{x: 2, y: 6}}, %Tile{material: :village, position: %Position{x: 2, y: 7}}, %Tile{material: :empty, position: %Position{x: 2, y: 8}}, %Tile{material: :farm, position: %Position{x: 2, y: 9}}, %Tile{material: :empty, position: %Position{x: 2, y: 10}}],
[%Tile{material: :empty, position: %Position{x: 3, y: 0}}, %Tile{material: :empty, position: %Position{x: 3, y: 1}}, %Tile{material: :empty, position: %Position{x: 3, y: 2}}, %Tile{material: :empty, position: %Position{x: 3, y: 3}}, %Tile{material: :empty, position: %Position{x: 3, y: 4}}, %Tile{material: :empty, position: %Position{x: 3, y: 5}}, %Tile{material: :empty, position: %Position{x: 3, y: 6}}, %Tile{material: :empty, position: %Position{x: 3, y: 7}}, %Tile{material: :empty, position: %Position{x: 3, y: 8}}, %Tile{material: :farm, position: %Position{x: 3, y: 9}}, %Tile{material: :empty, position: %Position{x: 3, y: 10}}],
[%Tile{material: :empty, position: %Position{x: 4, y: 0}}, %Tile{material: :empty, position: %Position{x: 4, y: 1}}, %Tile{material: :monster, position: %Position{x: 4, y: 2}}, %Tile{material: :monster, position: %Position{x: 4, y: 3}}, %Tile{material: :empty, position: %Position{x: 4, y: 4}}, %Tile{material: :empty, position: %Position{x: 4, y: 5}}, %Tile{material: :forest, position: %Position{x: 4, y: 6}}, %Tile{material: :forest, position: %Position{x: 4, y: 7}}, %Tile{material: :empty, position: %Position{x: 4, y: 8}}, %Tile{material: :farm, position: %Position{x: 4, y: 9}}, %Tile{material: :empty, position: %Position{x: 4, y: 10}}],
[%Tile{material: :empty, position: %Position{x: 5, y: 0}}, %Tile{material: :empty, position: %Position{x: 5, y: 1}}, %Tile{material: :monster, position: %Position{x: 5, y: 2}}, %Tile{material: :monster, position: %Position{x: 5, y: 3}}, %Tile{material: :empty, position: %Position{x: 5, y: 4}}, %Tile{material: :forest, position: %Position{x: 5, y: 5}}, %Tile{material: :forest, position: %Position{x: 5, y: 6}}, %Tile{material: :empty, position: %Position{x: 5, y: 7}}, %Tile{material: :empty, position: %Position{x: 5, y: 8}}, %Tile{material: :empty, position: %Position{x: 5, y: 9}}, %Tile{material: :empty, position: %Position{x: 5, y: 10}}],
[%Tile{material: :empty, position: %Position{x: 6, y: 0}}, %Tile{material: :empty, position: %Position{x: 6, y: 1}}, %Tile{material: :empty, position: %Position{x: 6, y: 2}}, %Tile{material: :empty, position: %Position{x: 6, y: 3}}, %Tile{material: :empty, position: %Position{x: 6, y: 4}}, %Tile{material: :empty, position: %Position{x: 6, y: 5}}, %Tile{material: :empty, position: %Position{x: 6, y: 6}}, %Tile{material: :empty, position: %Position{x: 6, y: 7}}, %Tile{material: :empty, position: %Position{x: 6, y: 8}}, %Tile{material: :empty, position: %Position{x: 6, y: 9}}, %Tile{material: :empty, position: %Position{x: 6, y: 10}}],
[%Tile{material: :empty, position: %Position{x: 7, y: 0}}, %Tile{material: :mountain, position: %Position{x: 7, y: 1}}, %Tile{material: :empty, position: %Position{x: 7, y: 2}}, %Tile{material: :mountain, position: %Position{x: 7, y: 3}}, %Tile{material: :empty, position: %Position{x: 7, y: 4}}, %Tile{material: :mountain, position: %Position{x: 7, y: 5}}, %Tile{material: :empty, position: %Position{x: 7, y: 6}}, %Tile{material: :mountain, position: %Position{x: 7, y: 7}}, %Tile{material: :empty, position: %Position{x: 7, y: 8}}, %Tile{material: :empty, position: %Position{x: 7, y: 9}}, %Tile{material: :empty, position: %Position{x: 7, y: 10}}],
[%Tile{material: :empty, position: %Position{x: 8, y: 0}}, %Tile{material: :empty, position: %Position{x: 8, y: 1}}, %Tile{material: :empty, position: %Position{x: 8, y: 2}}, %Tile{material: :empty, position: %Position{x: 8, y: 3}}, %Tile{material: :empty, position: %Position{x: 8, y: 4}}, %Tile{material: :empty, position: %Position{x: 8, y: 5}}, %Tile{material: :empty, position: %Position{x: 8, y: 6}}, %Tile{material: :empty, position: %Position{x: 8, y: 7}}, %Tile{material: :empty, position: %Position{x: 8, y: 8}}, %Tile{material: :empty, position: %Position{x: 8, y: 9}}, %Tile{material: :empty, position: %Position{x: 8, y: 10}}],
[%Tile{material: :empty, position: %Position{x: 9, y: 0}}, %Tile{material: :empty, position: %Position{x: 9, y: 1}}, %Tile{material: :empty, position: %Position{x: 9, y: 2}}, %Tile{material: :empty, position: %Position{x: 9, y: 3}}, %Tile{material: :empty, position: %Position{x: 9, y: 4}}, %Tile{material: :empty, position: %Position{x: 9, y: 5}}, %Tile{material: :empty, position: %Position{x: 9, y: 6}}, %Tile{material: :empty, position: %Position{x: 9, y: 7}}, %Tile{material: :empty, position: %Position{x: 9, y: 8}}, %Tile{material: :empty, position: %Position{x: 9, y: 9}}, %Tile{material: :empty, position: %Position{x: 9, y: 10}}],
[%Tile{material: :empty, position: %Position{x: 10, y: 0}}, %Tile{material: :empty, position: %Position{x: 10, y: 1}}, %Tile{material: :empty, position: %Position{x: 10, y: 2}}, %Tile{material: :empty, position: %Position{x: 10, y: 3}}, %Tile{material: :empty, position: %Position{x: 10, y: 4}}, %Tile{material: :empty, position: %Position{x: 10, y: 5}}, %Tile{material: :empty, position: %Position{x: 10, y: 6}}, %Tile{material: :empty, position: %Position{x: 10, y: 7}}, %Tile{material: :empty, position: %Position{x: 10, y: 8}}, %Tile{material: :empty, position: %Position{x: 10, y: 9}}, %Tile{material: :empty, position: %Position{x: 10, y: 10}}]
  ],
  ruins: [

  ]
}
  end
end
