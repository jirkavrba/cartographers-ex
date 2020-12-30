defmodule Cartographers.GameEngine.ScoringRules.CanalLake do
  @moduledoc """
  # Canal lake
  Earn one reputation star for each water space adjacent to at least one farm space.
  Earn one reputation star for each farm space adjacent to at least one water space.
  """
  alias Cartographers.GameEngine.MapSheet

  @behaviour Cartographers.GameEngine.Cards.EdictCard.ScoringRule

  @spec calculate_score(MapSheet.t()) :: integer
  def calculate_score(_map_sheet) do
    0
  end
end
