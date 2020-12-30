defmodule Cartographers.GameEngine.ScoringRules.Borderlands do
  @moduledoc """
  # Borderlands
  Earn six reputation stars for each complete row or complete column of filled spaces.
  """
  alias Cartographers.GameEngine.MapSheet

  @behaviour Cartographers.GameEngine.Cards.EdictCard.ScoringRule

  @spec calculate_score(MapSheet.t()) :: integer
  def calculate_score(_map_sheet) do
    0
  end
end
