defmodule Cartographers.GameEngine.ScoringRules.LostBarony do
  @moduledoc """
  # Lost barony
  Earn three reputation stars for each space along one edge of the largest square of filled spaces.
  """
  alias Cartographers.GameEngine.MapSheet

  @behaviour Cartographers.GameEngine.Cards.EdictCard.ScoringRule

  @spec calculate_score(MapSheet.t()) :: integer
  def calculate_score(_map_sheet) do
    0
  end
end
