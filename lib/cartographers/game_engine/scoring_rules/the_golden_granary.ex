defmodule Cartographers.GameEngine.ScoringRules.TheGoldenGranary do
  @moduledoc """
  # The golden granary
  Earn one reputation star for each water space adjacent to a ruins space.
  Earn three reputation stars for each farm space on a ruins space.
  """
  alias Cartographers.GameEngine.MapSheet

  @behaviour Cartographers.GameEngine.Cards.EdictCard.ScoringRule

  @spec calculate_score(MapSheet.t()) :: integer
  def calculate_score(map_sheet) do
    neighbors = map_sheet.ruins
    |> Enum.map(&MapSheet.tile_at(map_sheet, &1))
    |> Enum.map(&MapSheet.neighbour_tiles(map_sheet, &1))
    |> List.flatten
    |> Enum.uniq

    Enum.count(neighbors, &(&1.material == :water)) +
    Enum.count(neighbors, &(&1.material == :farm)) * 3
  end
end
