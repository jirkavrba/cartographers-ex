defmodule Cartographers.GameEngine.ScoringRules.TheCauldrons do
  @moduledoc """
  # The cauldrons
  Earn one reputation star for each empty space surrounded on all four sides by filled spaces or the edge of the map.
  """
  alias Cartographers.GameEngine.MapSheet

  @behaviour Cartographers.GameEngine.Cards.EdictCard.ScoringRule

  @spec calculate_score(MapSheet.t()) :: integer
  def calculate_score(_map_sheet) do
    0
  end
end
