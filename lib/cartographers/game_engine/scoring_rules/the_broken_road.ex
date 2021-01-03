defmodule Cartographers.GameEngine.ScoringRules.TheBrokenRoad do
  @moduledoc """
  # The broken road
  Earn three reputation stars for each complete diagonal line of filled spaces that touches the left and bottom edges of the map.
  """
  alias Cartographers.GameEngine.MapSheet
  alias Cartographers.GameEngine.MapSheet.Position
  alias Cartographers.GameEngine.MapSheet.Tile

  @behaviour Cartographers.GameEngine.Cards.EdictCard.ScoringRule

  @spec diagonal(MapSheet.t(), integer) :: list(Tile.t())
  defp diagonal(map_sheet, n) do
    0 .. 10
    |> Enum.map(&(%Position{x: n + &1, y: &1}))
    |> Enum.filter(&MapSheet.in_bounds?/1)
    |> Enum.map(&MapSheet.tile_at(map_sheet, &1))
  end

  @spec calculate_score(MapSheet.t()) :: integer
  def calculate_score(map_sheet) do
    filled_diagonals = 0 .. 10
    |> Enum.map(&diagonal(map_sheet, &1))
    |> Enum.reject(&Enum.empty?/1)
    |> Enum.count(fn (diagonal) -> Enum.all?(diagonal, &(&1.material != :empty)) end)

    filled_diagonals * 3
  end
end
