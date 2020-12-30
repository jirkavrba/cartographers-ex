defmodule Cartographers.GameEngine.ScoringRules.MagesValley do
  @moduledoc """
  # Mages valley
  Earn two reputation stars for each water space adjacent to a mountain space.
  Earn one reputation star for each farm space adjacent to a mountain space.
  """
  alias Cartographers.GameEngine.MapSheet

  @behaviour Cartographers.GameEngine.Cards.EdictCard.ScoringRule

  @spec calculate_score(MapSheet.t()) :: integer
  def calculate_score(_map_sheet) do
    0
  end
end
