defmodule Cartographers.GameEngine.ScoringRules.SentinelWood do
  @moduledoc """
  # Sentinel Wood
  Earn one reputation star for each forest space adjacent to the edge of the map.
  """
  alias Cartographers.GameEngine.MapSheet

  @behaviour Cartographers.GameEngine.Cards.EdictCard.ScoringRule

  @spec calculate_score(MapSheet.t()) :: integer
  def calculate_score(map_sheet) do
    (
      MapSheet.row(map_sheet, 0) ++
      MapSheet.row(map_sheet, 10) ++
      MapSheet.column(map_sheet, 0) ++
      MapSheet.column(map_sheet, 10)
    )
    |> Enum.uniq()
    |> Enum.count(&(&1.material == :forest))
  end
end
