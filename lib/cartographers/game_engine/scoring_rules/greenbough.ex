defmodule Cartographers.GameEngine.ScoringRules.Greenbough do
  @moduledoc """
  # Greenbough
  Earn one reputation star for each row and column with at least one forest space.
  The same forest space may be scored in a row and a column.
  """
  alias Cartographers.GameEngine.MapSheet

  @behaviour Cartographers.GameEngine.Cards.EdictCard.ScoringRule

  @spec calculate_score(MapSheet.t()) :: integer
  def calculate_score(map_sheet) do
    rows = MapSheet.rows(map_sheet)
    columns = MapSheet.columns(map_sheet)

    rows ++ columns |> Enum.count(fn (row) -> Enum.any?(row, &(&1.material == :forest)) end)
  end
end
