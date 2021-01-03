defmodule Cartographers.GameEngine.ScoringRules.GreenboughTest do
  use ExUnit.Case

  alias Cartographers.GameEngine.MapSheet
  alias Cartographers.GameEngine.MapSheet.Position
  alias Cartographers.GameEngine.MapSheet.Tile

  test "generated test 1609701323377" do
    assert Cartographers.GameEngine.ScoringRules.Greenbough.calculate_score(%MapSheet{
      tiles: [
    [%Tile{material: :empty, position: %Position{x: 0, y: 0}}, %Tile{material: :empty, position: %Position{x: 0, y: 1}}, %Tile{material: :empty, position: %Position{x: 0, y: 2}}, %Tile{material: :empty, position: %Position{x: 0, y: 3}}, %Tile{material: :empty, position: %Position{x: 0, y: 4}}, %Tile{material: :farm, position: %Position{x: 0, y: 5}}, %Tile{material: :empty, position: %Position{x: 0, y: 6}}, %Tile{material: :farm, position: %Position{x: 0, y: 7}}, %Tile{material: :farm, position: %Position{x: 0, y: 8}}, %Tile{material: :empty, position: %Position{x: 0, y: 9}}, %Tile{material: :empty, position: %Position{x: 0, y: 10}}],
    [%Tile{material: :empty, position: %Position{x: 1, y: 0}}, %Tile{material: :empty, position: %Position{x: 1, y: 1}}, %Tile{material: :empty, position: %Position{x: 1, y: 2}}, %Tile{material: :empty, position: %Position{x: 1, y: 3}}, %Tile{material: :empty, position: %Position{x: 1, y: 4}}, %Tile{material: :empty, position: %Position{x: 1, y: 5}}, %Tile{material: :water, position: %Position{x: 1, y: 6}}, %Tile{material: :empty, position: %Position{x: 1, y: 7}}, %Tile{material: :empty, position: %Position{x: 1, y: 8}}, %Tile{material: :monster, position: %Position{x: 1, y: 9}}, %Tile{material: :empty, position: %Position{x: 1, y: 10}}],
    [%Tile{material: :empty, position: %Position{x: 2, y: 0}}, %Tile{material: :empty, position: %Position{x: 2, y: 1}}, %Tile{material: :empty, position: %Position{x: 2, y: 2}}, %Tile{material: :empty, position: %Position{x: 2, y: 3}}, %Tile{material: :water, position: %Position{x: 2, y: 4}}, %Tile{material: :empty, position: %Position{x: 2, y: 5}}, %Tile{material: :empty, position: %Position{x: 2, y: 6}}, %Tile{material: :empty, position: %Position{x: 2, y: 7}}, %Tile{material: :empty, position: %Position{x: 2, y: 8}}, %Tile{material: :empty, position: %Position{x: 2, y: 9}}, %Tile{material: :monster, position: %Position{x: 2, y: 10}}],
    [%Tile{material: :empty, position: %Position{x: 3, y: 0}}, %Tile{material: :empty, position: %Position{x: 3, y: 1}}, %Tile{material: :forest, position: %Position{x: 3, y: 2}}, %Tile{material: :empty, position: %Position{x: 3, y: 3}}, %Tile{material: :empty, position: %Position{x: 3, y: 4}}, %Tile{material: :empty, position: %Position{x: 3, y: 5}}, %Tile{material: :farm, position: %Position{x: 3, y: 6}}, %Tile{material: :empty, position: %Position{x: 3, y: 7}}, %Tile{material: :empty, position: %Position{x: 3, y: 8}}, %Tile{material: :empty, position: %Position{x: 3, y: 9}}, %Tile{material: :monster, position: %Position{x: 3, y: 10}}],
    [%Tile{material: :empty, position: %Position{x: 4, y: 0}}, %Tile{material: :water, position: %Position{x: 4, y: 1}}, %Tile{material: :empty, position: %Position{x: 4, y: 2}}, %Tile{material: :empty, position: %Position{x: 4, y: 3}}, %Tile{material: :farm, position: %Position{x: 4, y: 4}}, %Tile{material: :farm, position: %Position{x: 4, y: 5}}, %Tile{material: :farm, position: %Position{x: 4, y: 6}}, %Tile{material: :empty, position: %Position{x: 4, y: 7}}, %Tile{material: :empty, position: %Position{x: 4, y: 8}}, %Tile{material: :forest, position: %Position{x: 4, y: 9}}, %Tile{material: :empty, position: %Position{x: 4, y: 10}}],
    [%Tile{material: :empty, position: %Position{x: 5, y: 0}}, %Tile{material: :water, position: %Position{x: 5, y: 1}}, %Tile{material: :empty, position: %Position{x: 5, y: 2}}, %Tile{material: :empty, position: %Position{x: 5, y: 3}}, %Tile{material: :farm, position: %Position{x: 5, y: 4}}, %Tile{material: :empty, position: %Position{x: 5, y: 5}}, %Tile{material: :empty, position: %Position{x: 5, y: 6}}, %Tile{material: :empty, position: %Position{x: 5, y: 7}}, %Tile{material: :forest, position: %Position{x: 5, y: 8}}, %Tile{material: :forest, position: %Position{x: 5, y: 9}}, %Tile{material: :empty, position: %Position{x: 5, y: 10}}],
    [%Tile{material: :empty, position: %Position{x: 6, y: 0}}, %Tile{material: :empty, position: %Position{x: 6, y: 1}}, %Tile{material: :empty, position: %Position{x: 6, y: 2}}, %Tile{material: :empty, position: %Position{x: 6, y: 3}}, %Tile{material: :empty, position: %Position{x: 6, y: 4}}, %Tile{material: :empty, position: %Position{x: 6, y: 5}}, %Tile{material: :empty, position: %Position{x: 6, y: 6}}, %Tile{material: :village, position: %Position{x: 6, y: 7}}, %Tile{material: :empty, position: %Position{x: 6, y: 8}}, %Tile{material: :empty, position: %Position{x: 6, y: 9}}, %Tile{material: :monster, position: %Position{x: 6, y: 10}}],
    [%Tile{material: :empty, position: %Position{x: 7, y: 0}}, %Tile{material: :empty, position: %Position{x: 7, y: 1}}, %Tile{material: :empty, position: %Position{x: 7, y: 2}}, %Tile{material: :empty, position: %Position{x: 7, y: 3}}, %Tile{material: :empty, position: %Position{x: 7, y: 4}}, %Tile{material: :village, position: %Position{x: 7, y: 5}}, %Tile{material: :village, position: %Position{x: 7, y: 6}}, %Tile{material: :village, position: %Position{x: 7, y: 7}}, %Tile{material: :empty, position: %Position{x: 7, y: 8}}, %Tile{material: :empty, position: %Position{x: 7, y: 9}}, %Tile{material: :monster, position: %Position{x: 7, y: 10}}],
    [%Tile{material: :empty, position: %Position{x: 8, y: 0}}, %Tile{material: :empty, position: %Position{x: 8, y: 1}}, %Tile{material: :empty, position: %Position{x: 8, y: 2}}, %Tile{material: :water, position: %Position{x: 8, y: 3}}, %Tile{material: :empty, position: %Position{x: 8, y: 4}}, %Tile{material: :village, position: %Position{x: 8, y: 5}}, %Tile{material: :empty, position: %Position{x: 8, y: 6}}, %Tile{material: :empty, position: %Position{x: 8, y: 7}}, %Tile{material: :empty, position: %Position{x: 8, y: 8}}, %Tile{material: :empty, position: %Position{x: 8, y: 9}}, %Tile{material: :monster, position: %Position{x: 8, y: 10}}],
    [%Tile{material: :empty, position: %Position{x: 9, y: 0}}, %Tile{material: :water, position: %Position{x: 9, y: 1}}, %Tile{material: :water, position: %Position{x: 9, y: 2}}, %Tile{material: :water, position: %Position{x: 9, y: 3}}, %Tile{material: :empty, position: %Position{x: 9, y: 4}}, %Tile{material: :village, position: %Position{x: 9, y: 5}}, %Tile{material: :empty, position: %Position{x: 9, y: 6}}, %Tile{material: :empty, position: %Position{x: 9, y: 7}}, %Tile{material: :empty, position: %Position{x: 9, y: 8}}, %Tile{material: :empty, position: %Position{x: 9, y: 9}}, %Tile{material: :monster, position: %Position{x: 9, y: 10}}],
    [%Tile{material: :empty, position: %Position{x: 10, y: 0}}, %Tile{material: :empty, position: %Position{x: 10, y: 1}}, %Tile{material: :empty, position: %Position{x: 10, y: 2}}, %Tile{material: :empty, position: %Position{x: 10, y: 3}}, %Tile{material: :empty, position: %Position{x: 10, y: 4}}, %Tile{material: :empty, position: %Position{x: 10, y: 5}}, %Tile{material: :empty, position: %Position{x: 10, y: 6}}, %Tile{material: :empty, position: %Position{x: 10, y: 7}}, %Tile{material: :empty, position: %Position{x: 10, y: 8}}, %Tile{material: :empty, position: %Position{x: 10, y: 9}}, %Tile{material: :empty, position: %Position{x: 10, y: 10}}]
      ],
      ruins: [

      ]
    }) == 6
  end

  test "generated test 1609701361806" do
    assert Cartographers.GameEngine.ScoringRules.Greenbough.calculate_score(%MapSheet{
      tiles: [
    [%Tile{material: :empty, position: %Position{x: 0, y: 0}}, %Tile{material: :empty, position: %Position{x: 0, y: 1}}, %Tile{material: :empty, position: %Position{x: 0, y: 2}}, %Tile{material: :empty, position: %Position{x: 0, y: 3}}, %Tile{material: :empty, position: %Position{x: 0, y: 4}}, %Tile{material: :farm, position: %Position{x: 0, y: 5}}, %Tile{material: :empty, position: %Position{x: 0, y: 6}}, %Tile{material: :farm, position: %Position{x: 0, y: 7}}, %Tile{material: :farm, position: %Position{x: 0, y: 8}}, %Tile{material: :empty, position: %Position{x: 0, y: 9}}, %Tile{material: :empty, position: %Position{x: 0, y: 10}}],
    [%Tile{material: :empty, position: %Position{x: 1, y: 0}}, %Tile{material: :empty, position: %Position{x: 1, y: 1}}, %Tile{material: :empty, position: %Position{x: 1, y: 2}}, %Tile{material: :empty, position: %Position{x: 1, y: 3}}, %Tile{material: :empty, position: %Position{x: 1, y: 4}}, %Tile{material: :empty, position: %Position{x: 1, y: 5}}, %Tile{material: :water, position: %Position{x: 1, y: 6}}, %Tile{material: :empty, position: %Position{x: 1, y: 7}}, %Tile{material: :empty, position: %Position{x: 1, y: 8}}, %Tile{material: :monster, position: %Position{x: 1, y: 9}}, %Tile{material: :empty, position: %Position{x: 1, y: 10}}],
    [%Tile{material: :empty, position: %Position{x: 2, y: 0}}, %Tile{material: :empty, position: %Position{x: 2, y: 1}}, %Tile{material: :empty, position: %Position{x: 2, y: 2}}, %Tile{material: :empty, position: %Position{x: 2, y: 3}}, %Tile{material: :water, position: %Position{x: 2, y: 4}}, %Tile{material: :empty, position: %Position{x: 2, y: 5}}, %Tile{material: :empty, position: %Position{x: 2, y: 6}}, %Tile{material: :empty, position: %Position{x: 2, y: 7}}, %Tile{material: :empty, position: %Position{x: 2, y: 8}}, %Tile{material: :empty, position: %Position{x: 2, y: 9}}, %Tile{material: :monster, position: %Position{x: 2, y: 10}}],
    [%Tile{material: :empty, position: %Position{x: 3, y: 0}}, %Tile{material: :empty, position: %Position{x: 3, y: 1}}, %Tile{material: :forest, position: %Position{x: 3, y: 2}}, %Tile{material: :empty, position: %Position{x: 3, y: 3}}, %Tile{material: :empty, position: %Position{x: 3, y: 4}}, %Tile{material: :empty, position: %Position{x: 3, y: 5}}, %Tile{material: :farm, position: %Position{x: 3, y: 6}}, %Tile{material: :empty, position: %Position{x: 3, y: 7}}, %Tile{material: :empty, position: %Position{x: 3, y: 8}}, %Tile{material: :empty, position: %Position{x: 3, y: 9}}, %Tile{material: :monster, position: %Position{x: 3, y: 10}}],
    [%Tile{material: :empty, position: %Position{x: 4, y: 0}}, %Tile{material: :water, position: %Position{x: 4, y: 1}}, %Tile{material: :empty, position: %Position{x: 4, y: 2}}, %Tile{material: :empty, position: %Position{x: 4, y: 3}}, %Tile{material: :farm, position: %Position{x: 4, y: 4}}, %Tile{material: :farm, position: %Position{x: 4, y: 5}}, %Tile{material: :farm, position: %Position{x: 4, y: 6}}, %Tile{material: :empty, position: %Position{x: 4, y: 7}}, %Tile{material: :empty, position: %Position{x: 4, y: 8}}, %Tile{material: :forest, position: %Position{x: 4, y: 9}}, %Tile{material: :empty, position: %Position{x: 4, y: 10}}],
    [%Tile{material: :empty, position: %Position{x: 5, y: 0}}, %Tile{material: :water, position: %Position{x: 5, y: 1}}, %Tile{material: :empty, position: %Position{x: 5, y: 2}}, %Tile{material: :empty, position: %Position{x: 5, y: 3}}, %Tile{material: :farm, position: %Position{x: 5, y: 4}}, %Tile{material: :empty, position: %Position{x: 5, y: 5}}, %Tile{material: :empty, position: %Position{x: 5, y: 6}}, %Tile{material: :empty, position: %Position{x: 5, y: 7}}, %Tile{material: :forest, position: %Position{x: 5, y: 8}}, %Tile{material: :forest, position: %Position{x: 5, y: 9}}, %Tile{material: :empty, position: %Position{x: 5, y: 10}}],
    [%Tile{material: :empty, position: %Position{x: 6, y: 0}}, %Tile{material: :empty, position: %Position{x: 6, y: 1}}, %Tile{material: :empty, position: %Position{x: 6, y: 2}}, %Tile{material: :empty, position: %Position{x: 6, y: 3}}, %Tile{material: :empty, position: %Position{x: 6, y: 4}}, %Tile{material: :empty, position: %Position{x: 6, y: 5}}, %Tile{material: :empty, position: %Position{x: 6, y: 6}}, %Tile{material: :village, position: %Position{x: 6, y: 7}}, %Tile{material: :empty, position: %Position{x: 6, y: 8}}, %Tile{material: :empty, position: %Position{x: 6, y: 9}}, %Tile{material: :monster, position: %Position{x: 6, y: 10}}],
    [%Tile{material: :empty, position: %Position{x: 7, y: 0}}, %Tile{material: :empty, position: %Position{x: 7, y: 1}}, %Tile{material: :empty, position: %Position{x: 7, y: 2}}, %Tile{material: :empty, position: %Position{x: 7, y: 3}}, %Tile{material: :empty, position: %Position{x: 7, y: 4}}, %Tile{material: :village, position: %Position{x: 7, y: 5}}, %Tile{material: :village, position: %Position{x: 7, y: 6}}, %Tile{material: :village, position: %Position{x: 7, y: 7}}, %Tile{material: :empty, position: %Position{x: 7, y: 8}}, %Tile{material: :empty, position: %Position{x: 7, y: 9}}, %Tile{material: :monster, position: %Position{x: 7, y: 10}}],
    [%Tile{material: :empty, position: %Position{x: 8, y: 0}}, %Tile{material: :empty, position: %Position{x: 8, y: 1}}, %Tile{material: :empty, position: %Position{x: 8, y: 2}}, %Tile{material: :water, position: %Position{x: 8, y: 3}}, %Tile{material: :empty, position: %Position{x: 8, y: 4}}, %Tile{material: :village, position: %Position{x: 8, y: 5}}, %Tile{material: :empty, position: %Position{x: 8, y: 6}}, %Tile{material: :empty, position: %Position{x: 8, y: 7}}, %Tile{material: :empty, position: %Position{x: 8, y: 8}}, %Tile{material: :empty, position: %Position{x: 8, y: 9}}, %Tile{material: :monster, position: %Position{x: 8, y: 10}}],
    [%Tile{material: :empty, position: %Position{x: 9, y: 0}}, %Tile{material: :water, position: %Position{x: 9, y: 1}}, %Tile{material: :water, position: %Position{x: 9, y: 2}}, %Tile{material: :water, position: %Position{x: 9, y: 3}}, %Tile{material: :empty, position: %Position{x: 9, y: 4}}, %Tile{material: :village, position: %Position{x: 9, y: 5}}, %Tile{material: :empty, position: %Position{x: 9, y: 6}}, %Tile{material: :empty, position: %Position{x: 9, y: 7}}, %Tile{material: :empty, position: %Position{x: 9, y: 8}}, %Tile{material: :empty, position: %Position{x: 9, y: 9}}, %Tile{material: :monster, position: %Position{x: 9, y: 10}}],
    [%Tile{material: :forest, position: %Position{x: 10, y: 0}}, %Tile{material: :empty, position: %Position{x: 10, y: 1}}, %Tile{material: :empty, position: %Position{x: 10, y: 2}}, %Tile{material: :empty, position: %Position{x: 10, y: 3}}, %Tile{material: :forest, position: %Position{x: 10, y: 4}}, %Tile{material: :empty, position: %Position{x: 10, y: 5}}, %Tile{material: :empty, position: %Position{x: 10, y: 6}}, %Tile{material: :empty, position: %Position{x: 10, y: 7}}, %Tile{material: :forest, position: %Position{x: 10, y: 8}}, %Tile{material: :empty, position: %Position{x: 10, y: 9}}, %Tile{material: :empty, position: %Position{x: 10, y: 10}}]
      ],
      ruins: [

      ]
    }) == 9
  end

  test "generated test 1609701458715" do
    assert Cartographers.GameEngine.ScoringRules.Greenbough.calculate_score(%MapSheet{
      tiles: [
    [%Tile{material: :empty, position: %Position{x: 0, y: 0}}, %Tile{material: :empty, position: %Position{x: 0, y: 1}}, %Tile{material: :empty, position: %Position{x: 0, y: 2}}, %Tile{material: :empty, position: %Position{x: 0, y: 3}}, %Tile{material: :empty, position: %Position{x: 0, y: 4}}, %Tile{material: :farm, position: %Position{x: 0, y: 5}}, %Tile{material: :empty, position: %Position{x: 0, y: 6}}, %Tile{material: :farm, position: %Position{x: 0, y: 7}}, %Tile{material: :farm, position: %Position{x: 0, y: 8}}, %Tile{material: :empty, position: %Position{x: 0, y: 9}}, %Tile{material: :forest, position: %Position{x: 0, y: 10}}],
    [%Tile{material: :empty, position: %Position{x: 1, y: 0}}, %Tile{material: :empty, position: %Position{x: 1, y: 1}}, %Tile{material: :empty, position: %Position{x: 1, y: 2}}, %Tile{material: :empty, position: %Position{x: 1, y: 3}}, %Tile{material: :empty, position: %Position{x: 1, y: 4}}, %Tile{material: :empty, position: %Position{x: 1, y: 5}}, %Tile{material: :water, position: %Position{x: 1, y: 6}}, %Tile{material: :empty, position: %Position{x: 1, y: 7}}, %Tile{material: :empty, position: %Position{x: 1, y: 8}}, %Tile{material: :forest, position: %Position{x: 1, y: 9}}, %Tile{material: :empty, position: %Position{x: 1, y: 10}}],
    [%Tile{material: :empty, position: %Position{x: 2, y: 0}}, %Tile{material: :empty, position: %Position{x: 2, y: 1}}, %Tile{material: :empty, position: %Position{x: 2, y: 2}}, %Tile{material: :empty, position: %Position{x: 2, y: 3}}, %Tile{material: :water, position: %Position{x: 2, y: 4}}, %Tile{material: :empty, position: %Position{x: 2, y: 5}}, %Tile{material: :empty, position: %Position{x: 2, y: 6}}, %Tile{material: :empty, position: %Position{x: 2, y: 7}}, %Tile{material: :forest, position: %Position{x: 2, y: 8}}, %Tile{material: :empty, position: %Position{x: 2, y: 9}}, %Tile{material: :monster, position: %Position{x: 2, y: 10}}],
    [%Tile{material: :empty, position: %Position{x: 3, y: 0}}, %Tile{material: :empty, position: %Position{x: 3, y: 1}}, %Tile{material: :forest, position: %Position{x: 3, y: 2}}, %Tile{material: :empty, position: %Position{x: 3, y: 3}}, %Tile{material: :empty, position: %Position{x: 3, y: 4}}, %Tile{material: :empty, position: %Position{x: 3, y: 5}}, %Tile{material: :farm, position: %Position{x: 3, y: 6}}, %Tile{material: :forest, position: %Position{x: 3, y: 7}}, %Tile{material: :empty, position: %Position{x: 3, y: 8}}, %Tile{material: :empty, position: %Position{x: 3, y: 9}}, %Tile{material: :monster, position: %Position{x: 3, y: 10}}],
    [%Tile{material: :empty, position: %Position{x: 4, y: 0}}, %Tile{material: :water, position: %Position{x: 4, y: 1}}, %Tile{material: :empty, position: %Position{x: 4, y: 2}}, %Tile{material: :empty, position: %Position{x: 4, y: 3}}, %Tile{material: :farm, position: %Position{x: 4, y: 4}}, %Tile{material: :farm, position: %Position{x: 4, y: 5}}, %Tile{material: :forest, position: %Position{x: 4, y: 6}}, %Tile{material: :empty, position: %Position{x: 4, y: 7}}, %Tile{material: :empty, position: %Position{x: 4, y: 8}}, %Tile{material: :forest, position: %Position{x: 4, y: 9}}, %Tile{material: :empty, position: %Position{x: 4, y: 10}}],
    [%Tile{material: :empty, position: %Position{x: 5, y: 0}}, %Tile{material: :water, position: %Position{x: 5, y: 1}}, %Tile{material: :empty, position: %Position{x: 5, y: 2}}, %Tile{material: :empty, position: %Position{x: 5, y: 3}}, %Tile{material: :farm, position: %Position{x: 5, y: 4}}, %Tile{material: :forest, position: %Position{x: 5, y: 5}}, %Tile{material: :empty, position: %Position{x: 5, y: 6}}, %Tile{material: :empty, position: %Position{x: 5, y: 7}}, %Tile{material: :forest, position: %Position{x: 5, y: 8}}, %Tile{material: :forest, position: %Position{x: 5, y: 9}}, %Tile{material: :empty, position: %Position{x: 5, y: 10}}],
    [%Tile{material: :empty, position: %Position{x: 6, y: 0}}, %Tile{material: :forest, position: %Position{x: 6, y: 1}}, %Tile{material: :empty, position: %Position{x: 6, y: 2}}, %Tile{material: :forest, position: %Position{x: 6, y: 3}}, %Tile{material: :forest, position: %Position{x: 6, y: 4}}, %Tile{material: :empty, position: %Position{x: 6, y: 5}}, %Tile{material: :empty, position: %Position{x: 6, y: 6}}, %Tile{material: :village, position: %Position{x: 6, y: 7}}, %Tile{material: :empty, position: %Position{x: 6, y: 8}}, %Tile{material: :empty, position: %Position{x: 6, y: 9}}, %Tile{material: :monster, position: %Position{x: 6, y: 10}}],
    [%Tile{material: :empty, position: %Position{x: 7, y: 0}}, %Tile{material: :forest, position: %Position{x: 7, y: 1}}, %Tile{material: :empty, position: %Position{x: 7, y: 2}}, %Tile{material: :forest, position: %Position{x: 7, y: 3}}, %Tile{material: :empty, position: %Position{x: 7, y: 4}}, %Tile{material: :village, position: %Position{x: 7, y: 5}}, %Tile{material: :village, position: %Position{x: 7, y: 6}}, %Tile{material: :village, position: %Position{x: 7, y: 7}}, %Tile{material: :empty, position: %Position{x: 7, y: 8}}, %Tile{material: :empty, position: %Position{x: 7, y: 9}}, %Tile{material: :monster, position: %Position{x: 7, y: 10}}],
    [%Tile{material: :empty, position: %Position{x: 8, y: 0}}, %Tile{material: :empty, position: %Position{x: 8, y: 1}}, %Tile{material: :forest, position: %Position{x: 8, y: 2}}, %Tile{material: :water, position: %Position{x: 8, y: 3}}, %Tile{material: :empty, position: %Position{x: 8, y: 4}}, %Tile{material: :village, position: %Position{x: 8, y: 5}}, %Tile{material: :empty, position: %Position{x: 8, y: 6}}, %Tile{material: :empty, position: %Position{x: 8, y: 7}}, %Tile{material: :empty, position: %Position{x: 8, y: 8}}, %Tile{material: :empty, position: %Position{x: 8, y: 9}}, %Tile{material: :monster, position: %Position{x: 8, y: 10}}],
    [%Tile{material: :empty, position: %Position{x: 9, y: 0}}, %Tile{material: :forest, position: %Position{x: 9, y: 1}}, %Tile{material: :water, position: %Position{x: 9, y: 2}}, %Tile{material: :water, position: %Position{x: 9, y: 3}}, %Tile{material: :empty, position: %Position{x: 9, y: 4}}, %Tile{material: :village, position: %Position{x: 9, y: 5}}, %Tile{material: :empty, position: %Position{x: 9, y: 6}}, %Tile{material: :empty, position: %Position{x: 9, y: 7}}, %Tile{material: :empty, position: %Position{x: 9, y: 8}}, %Tile{material: :empty, position: %Position{x: 9, y: 9}}, %Tile{material: :monster, position: %Position{x: 9, y: 10}}],
    [%Tile{material: :forest, position: %Position{x: 10, y: 0}}, %Tile{material: :empty, position: %Position{x: 10, y: 1}}, %Tile{material: :empty, position: %Position{x: 10, y: 2}}, %Tile{material: :empty, position: %Position{x: 10, y: 3}}, %Tile{material: :forest, position: %Position{x: 10, y: 4}}, %Tile{material: :empty, position: %Position{x: 10, y: 5}}, %Tile{material: :empty, position: %Position{x: 10, y: 6}}, %Tile{material: :empty, position: %Position{x: 10, y: 7}}, %Tile{material: :forest, position: %Position{x: 10, y: 8}}, %Tile{material: :empty, position: %Position{x: 10, y: 9}}, %Tile{material: :empty, position: %Position{x: 10, y: 10}}]
      ],
      ruins: [

      ]
    }) == 22
  end
end
