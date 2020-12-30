defmodule Cartographers.GameEngine.ScoringRules.ShoresideExpanse do
  @moduledoc """
  # Shoreside expanse
  Earn three reputation stars for each cluster of farm spaces not adjacent to a water space or the edge of the map.
  Earn three reputation stars for each cluster of water spaces not adjacent to a farm space or the edge of the map.
  """
  alias Cartographers.GameEngine.MapSheet

  @behaviour Cartographers.GameEngine.Cards.EdictCard.ScoringRule

  @spec calculate_score(MapSheet.t()) :: integer
  def calculate_score(_map_sheet) do
    0
  end
end
