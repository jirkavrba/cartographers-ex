defmodule Cartographers.GameEngine.ScoringRules.GreengoldPlains do
  @moduledoc """
  # Greengold plains
  Earn three reputation stars for each cluster of villages spaces that is adjacent to three or more different terrain types.
  """
  alias Cartographers.GameEngine.MapSheet

  @behaviour Cartographers.GameEngine.Cards.EdictCard.ScoringRule

  @spec calculate_score(MapSheet.t()) :: integer
  def calculate_score(_map_sheet) do
    0
  end
end
