defmodule Cartographers.GameEngine.ScoringRules.Greenbough do
  @moduledoc """
  # Greenbough
  Earn one reputation star for each row and column with at least one forest space. The same forest space may be scored in a row and a column.
  """
  alias Cartographers.GameEngine.MapSheet

  @behaviour Cartographers.GameEngine.Cards.EdictCard.ScoringRule

  @spec calculate_score(MapSheet.t()) :: integer
  def calculate_score(_map_sheet) do
    0
  end
end
