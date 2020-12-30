defmodule Cartographers.GameEngine.MapSheet do
  @moduledoc """
  Representation of the map sheet that every player receives at the beggining of the game
  """
  @enforce_keys [:tiles, :ruins]
  @type t :: %__MODULE__{ # A 11x11 matrix of tiles representing the paper sheet
          tiles: list(list(Tile.t())),
          ruins: list(Position.t())
        }
  defstruct [:tiles, :ruins]

  defmodule Position do
    @moduledoc """
    Wrapper for position on the map sheet.
    In the desktop version the x is represented by numbers 1 .. 11 and y is a letter within A .. K
    """
    @enforce_keys [:x, :y]
    @type t :: %__MODULE__{
            x: integer,
            y: integer
          }
    defstruct [:x, :y]
  end

  defmodule Tile do
    @moduledoc """
    Wrapper for a single map sheet tile. Contains information about its location and material.
    There is a special material for unoccupied tiles: `:empty`
    """
    @enforce_keys [:material, :position]
    @type t :: %__MODULE__{
            material: material,
            position: Position.t()
          }
    defstruct [:material, :position]

    @type material :: :empty | :forest | :village | :farm | :water | :monster | :mountain
  end

  @doc """
  Returns a tile at the given position or nil when the specified coordinates are out of bounds
  """
  @spec tile_at(MapSheet.t(), integer, integer) :: Tile.t()
  def tile_at(map_sheet = %__MODULE__{}, x, y), do: tile_at(map_sheet, %Position{x: x, y: y})

  @spec tile_at(MapSheet.t(), Position.t()) :: Tile.t()
  def tile_at(map_sheet = %__MODULE__{}, position = %Position{}) do
    if in_bounds?(position),
      do: map_sheet.tiles[position.y][position.x],
      else: nil
  end

  @doc """
  Determines, whether the given position or tile is within bounds of the map sheet.
  """
  @spec in_bounds?(Position.t()) :: boolean
  def in_bounds?(position = %Position{}) do
    min(position.x, position.y) >= 0 &&
    max(position.x, position.y) < 11
  end

  @spec in_bounds?(Tile.t()) :: boolean
  def in_bounds?(tile = %Tile{}) do
    position = tile.position
    min(position.x, position.y) >= 0 &&
    max(position.x, position.y) < 11
  end

  @doc """
  Returns a list of adjanced tiles of a given tile.
  """
  @spec neighbour_tiles(MapSheet.t(), Tile.t()) :: list(Tile.t())
  def neighbour_tiles(map_sheet, tile) do
    vectors = [{-1, 0}, {0, -1}, {1, 0}, {0, 1}]
    vectors
      |> Enum.map(fn ({x, y}) -> %Position{x: tile.position.x + x, y: tile.position.y + y} end)
      |> Enum.filter(&in_bounds?/1)
      |> Enum.map(&map_sheet.tile_at(&1))
  end
end
