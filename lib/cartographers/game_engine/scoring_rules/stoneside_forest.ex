defmodule Cartographers.GameEngine.ScoringRules.StonesideForest do
  @moduledoc """
  # Stoneside Forest
  Earn three reputation stars for each mountain space connected to another mountain space by a cluster of forest spaces.
  """
  alias Cartographers.GameEngine.MapSheet

  @behaviour Cartographers.GameEngine.Cards.EdictCard.ScoringRule

  @spec calculate_score(MapSheet.t()) :: integer
  def calculate_score(_map_sheet) do
    0
  end
end
