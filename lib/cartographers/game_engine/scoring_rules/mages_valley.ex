defmodule Cartographers.GameEngine.ScoringRules.MagesValley do
  @moduledoc """
  # Mages valley
  Earn two reputation stars for each water space adjacent to a mountain space.
  Earn one reputation star for each farm space adjacent to a mountain space.
  """
  alias Cartographers.GameEngine.MapSheet
  alias Cartographers.GameEngine.Game

  @behaviour Cartographers.GameEngine.Cards.EdictCard.ScoringRule

  # TODO: This code is duplicated among this rule and CanalLake
  @spec neighbours_by_material(MapSheet.t(), Game.material(), Game.material()) :: integer
  defp neighbours_by_material(map_sheet, source_material, target_material) do
    map_sheet
    |> MapSheet.tiles_by_material(source_material)
    |> Enum.count(fn (tile) -> MapSheet.neighbour_tiles(map_sheet, tile) |> Enum.any?(&(&1.material == target_material)) end)
  end

  @spec calculate_score(MapSheet.t()) :: integer
  def calculate_score(map_sheet) do
    neighbours_by_material(map_sheet, :water, :mountain) * 2 +
    neighbours_by_material(map_sheet, :farm, :mountain)
  end
end
