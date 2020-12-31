defmodule Cartographers.GameEngine.GameTest do
  use ExUnit.Case

  alias Cartographers.GameEngine.Game
  alias Cartographers.GameEngine.Values
  alias Cartographers.GameEngine.MapSheet

  test "game can be created (with no players)" do
    game = Game.create([])

    # Expected length is number of explore cards + number of ruins cards + 1 monster card
    assert Enum.count(game.drawing_deck)== (Values.explore_cards ++ Values.ruins_cards |> Enum.count) + 1
    assert Enum.count(game.discard_deck)== 0
    assert Map.keys(game.picked_edict_cards) == [:a, :b, :c, :d]
    assert game.picked_edict_cards |> Map.values |> Enum.all?(&(&1.calculate_score(MapSheet.empty)) == 0)
  end
end
