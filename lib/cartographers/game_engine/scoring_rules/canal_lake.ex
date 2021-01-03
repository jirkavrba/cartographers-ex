defmodule Cartographers.GameEngine.ScoringRules.CanalLake do
  @moduledoc """
  # Canal lake
  Earn one reputation star for each water space adjacent to at least one farm space.
  Earn one reputation star for each farm space adjacent to at least one water space.
  """
  alias Cartographers.GameEngine.MapSheet
  alias Cartographers.GameEngine.Game

  @behaviour Cartographers.GameEngine.Cards.EdictCard.ScoringRule

  @spec neighbours_by_material(MapSheet.t(), Game.material(), Game.material()) :: integer
  defp neighbours_by_material(map_sheet, source_material, target_material) do
    map_sheet
    |> MapSheet.tiles_by_material(source_material)
    |> Enum.count(fn (tile) -> MapSheet.neighbour_tiles(map_sheet, tile) |> Enum.any?(&(&1.material == target_material)) end)
  end

  @spec calculate_score(MapSheet.t()) :: integer
  def calculate_score(map_sheet) do
    neighbours_by_material(map_sheet, :water, :farm) +
    neighbours_by_material(map_sheet, :farm, :water)
  end
end
