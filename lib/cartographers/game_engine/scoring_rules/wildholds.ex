defmodule Cartographers.GameEngine.ScoringRules.Wildholds do
  @moduledoc """
  # Wildholds
  Earn eight reputation stars for each cluster of six or more village spaces.
  """
  alias Cartographers.GameEngine.MapSheet

  @behaviour Cartographers.GameEngine.Cards.EdictCard.ScoringRule

  @spec calculate_score(MapSheet.t()) :: integer
  def calculate_score(_map_sheet) do
    0
  end
end
