defmodule Cartographers.GameEngine.ScoringRules.TheGoldenGranary do
  @moduledoc """
  # The golden granary
  Earn one reputation star for each water space adjacent to a ruins space.
  Earn three reputation stars for each farm space on a ruins space.
  """
  alias Cartographers.GameEngine.MapSheet

  @behaviour Cartographers.GameEngine.Cards.EdictCard.ScoringRule

  @spec calculate_score(MapSheet.t()) :: integer
  def calculate_score(_map_sheet) do
    0
  end
end
