defmodule Cartographers.GameEngine.ScoringRules.SentinelWood do
  @moduledoc """
  # Sentinel Wood
  Earn one reputation star for each forest space adjacent to the edge of the map.
  """
  alias Cartographers.GameEngine.MapSheet

  @behaviour Cartographers.GameEngine.Cards.EdictCard.ScoringRule

  @spec calculate_score(MapSheet.t()) :: integer
  def calculate_score(_map_sheet) do
    0
  end
end
