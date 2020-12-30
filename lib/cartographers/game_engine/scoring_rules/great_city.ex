defmodule Cartographers.GameEngine.ScoringRules.GreatCity do
  @moduledoc """
  # Great city
  Earn one reputation star for each village space in the largest cluster of village spaces that is not adjacent to a mountain space.
  """
  alias Cartographers.GameEngine.MapSheet

  @behaviour Cartographers.GameEngine.Cards.EdictCard.ScoringRule

  @spec calculate_score(MapSheet.t()) :: integer
  def calculate_score(_map_sheet) do
    0
  end
end
