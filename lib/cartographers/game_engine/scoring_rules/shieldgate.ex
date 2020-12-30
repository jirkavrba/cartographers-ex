defmodule Cartographers.GameEngine.ScoringRules.Shieldgate do
  @moduledoc """
  # Shieldgate
  Earn two reputation stars for each village space in the second largest cluster of village spaces
  """
  alias Cartographers.GameEngine.MapSheet

  @behaviour Cartographers.GameEngine.Cards.EdictCard.ScoringRule

  @spec calculate_score(MapSheet.t()) :: integer
  def calculate_score(_map_sheet) do
    0
  end
end
