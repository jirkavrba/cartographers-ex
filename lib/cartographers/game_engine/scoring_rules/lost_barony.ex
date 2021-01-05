defmodule Cartographers.GameEngine.ScoringRules.LostBarony do
  @moduledoc """
  # Lost barony
  Earn three reputation stars for each space along one edge of the largest square of filled spaces.
  """
  alias Cartographers.GameEngine.MapSheet
  alias Cartographers.GameEngine.MapSheet.Position

  @behaviour Cartographers.GameEngine.Cards.EdictCard.ScoringRule

  @spec square(Position.t(), Position.t()) :: list(Position.t())
  defp square(%Position{x: x1, y: y1}, %Position{x: x2, y: y2}) do
    for x <- min(x1, x2) .. max(x1, x2),
        y <- min(y1, y2) .. max(y1, y2), do: %Position{x: x, y: y}
  end

  @spec all_squares() :: list(list(Position.t()))
  defp all_squares do
    for start_x <- 0 .. 9,
        start_y <- 0 .. 9,
        size    <- 1 .. 9, do:
          square(
            %Position{x: start_x, y: start_y},
            %Position{x: min(start_x + size, 10), y: min(start_y + size, 10)}
          )
  end

  @spec is_filled(MapSheet.t(), list(Position.t())) :: boolean
  defp is_filled(map_sheet, square) when is_list(square), do:
    square
    |> List.flatten
    |> Enum.map(&MapSheet.tile_at(map_sheet, &1))
    |> Enum.all?(&(&1.material != :empty))

  @spec largest_filled_square_size(MapSheet.t()) :: integer
  defp largest_filled_square_size(map_sheet) do
    all_squares()
    |> Enum.filter(&is_filled(map_sheet, &1))
    |> Enum.map(&Enum.count/1)
    |> Enum.max
  end

  @spec calculate_score(MapSheet.t()) :: integer
  def calculate_score(map_sheet) do
    size = map_sheet
      |> largest_filled_square_size()
      |> :math.sqrt
      |> trunc()

    size * 3
  end
end
