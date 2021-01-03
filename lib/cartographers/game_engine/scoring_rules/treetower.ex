defmodule Cartographers.GameEngine.ScoringRules.Treetower do
  @moduledoc """
  # Treetower
  Earn one reputation star for each forest space surrounded on all four sides by filled spaces or the edge of the map.
  """
  alias Cartographers.GameEngine.MapSheet

  @behaviour Cartographers.GameEngine.Cards.EdictCard.ScoringRule

  @spec calculate_score(MapSheet.t()) :: integer
  def calculate_score(map_sheet) do
    map_sheet
    |> MapSheet.tiles_by_material(:forest)
    |> Enum.map(&MapSheet.neighbour_tiles(map_sheet, &1))
    |> Enum.count(fn (neighbors) -> Enum.all?(neighbors, &(&1.material != :empty)) end)
  end
end
