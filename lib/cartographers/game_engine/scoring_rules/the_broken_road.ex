defmodule Cartographers.GameEngine.ScoringRules.TheBrokenRoad do
  @moduledoc """
  # The broken road
  Earn three reputation stars for each complete diagonal line of filled spaces that touches the left and bottom edges of the map.
  """
  alias Cartographers.GameEngine.MapSheet

  @behaviour Cartographers.GameEngine.Cards.EdictCard.ScoringRule

  @spec calculate_score(MapSheet.t()) :: integer
  def calculate_score(_map_sheet) do
    0
  end
end
