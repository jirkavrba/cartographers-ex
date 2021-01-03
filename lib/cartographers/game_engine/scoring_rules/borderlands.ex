defmodule Cartographers.GameEngine.ScoringRules.Borderlands do
  @moduledoc """
  # Borderlands
  Earn six reputation stars for each complete row or complete column of filled spaces.
  """
  alias Cartographers.GameEngine.MapSheet

  @behaviour Cartographers.GameEngine.Cards.EdictCard.ScoringRule

  @spec contains_empty_space(list(Tile.t())) :: boolean
  defp contains_empty_space(row), do: row |> Enum.any?(&(&1.material == :empty))

  @spec calculate_score(MapSheet.t()) :: integer
  def calculate_score(map_sheet) do
    rows = MapSheet.rows(map_sheet)
    columns = MapSheet.columns(map_sheet)

    6 * (
      rows ++ columns
        |> Enum.reject(&contains_empty_space/1)
        |> Enum.count()
    )
  end
end
