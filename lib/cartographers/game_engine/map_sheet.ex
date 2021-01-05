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

  defmodule Cluster do
    @moduledoc """
    Wrapper for a cluster of adjanced tiles that share the same material
    """
    @enforce_keys [:material, :size, :tiles]
    @type t :: %__MODULE__{
      material: Tile.material,
      size: integer,
      tiles: list(Tile.t())
    }
    defstruct [:material, :size, :tiles]
  end

  @doc """
  Creates an empty map sheet to save some boilerplate code across the application
  """
  @spec empty :: MapSheet.t()
  def empty, do: %__MODULE__{
    ruins: [],
    tiles: for i <- 0 .. 10 do Enum.map(0 .. 10, &(
      %Tile{
        position: %Position{x: i, y: &1},
        material: :empty
       }
     ))
    end
  }

  @doc """
  Shorthand method for creating map sheets
  There are several symbols representing different materials

  e = Empty, f = Forest, w = Water, v = Village, m = Mountain, F = Farm, M = Monster

  Example:
  MapSheet.make([
    "eeeeeeeefee",
    "emeeemeefee",
    "eeeMemmmfee",
    "eeFeeeeefee",
    "eeeeeweefee",
    "eeeewvvvfee",
    "eeeeeeevfee",
    "eeFeeeeefee",
    "eeeeeweefee",
    "eeeewvvvfee",
    "emeeemeefee"
  ])
  """
  @spec make(list(String.t()), list(Position.t())) :: MapSheet.t()
  def make(source, ruins \\ []) when is_list(source) do
    tiles = source
    |> Enum.map(&String.trim/1)
    |> Enum.map(&String.graphemes/1)
    |> Enum.map(fn (line) -> Enum.map(line, &(case &1 do
          "e" -> :empty
          "f" -> :forest
          "w" -> :water
          "v" -> :village
          "m" -> :mountain
          "F" -> :farm
          "M" -> :monster
        end))
      end)
    |> Enum.with_index
    |> Enum.map(fn ({rows, x}) ->
      rows
      |> Enum.with_index
      |> Enum.map(fn ({tile, y}) -> %Tile{
          material: tile,
          position: %Position{
            x: x,
            y: y
          }
        } end)
      end)

    %__MODULE__{
      ruins: ruins,
      tiles: tiles
    }
  end

  @doc """
  Returns a tile at the given position or nil when the specified coordinates are out of bounds
  """
  @spec tile_at(MapSheet.t(), integer, integer) :: Tile.t()
  def tile_at(map_sheet, x, y), do: tile_at(map_sheet, %Position{x: x, y: y})

  @spec tile_at(MapSheet.t(), Position.t()) :: Tile.t()
  def tile_at(map_sheet, position = %Position{x: x, y: y}) do
    if in_bounds?(position),
      do: map_sheet.tiles |> Enum.at(x) |> Enum.at(y),
      else: nil
  end

  @doc """
  Determines, whether the given position or tile is within bounds of the map sheet.
  """
  @spec in_bounds?(Position.t()) :: boolean
  def in_bounds?(%Position{} = position) do
    min(position.x, position.y) >= 0 &&
    max(position.x, position.y) < 11
  end

  @spec in_bounds?(Tile.t()) :: boolean
  def in_bounds?(%Tile{} = tile), do: in_bounds?(tile.position)

  @doc """
  Returns a list of tiles adjanced to the given tile.
  """
  @spec neighbour_tiles(MapSheet.t(), Tile.t()) :: list(Tile.t())
  def neighbour_tiles(map_sheet, tile) do
    vectors = [{-1, 0}, {0, -1}, {1, 0}, {0, 1}]
    vectors
      |> Enum.map(fn ({x, y}) -> %Position{x: tile.position.x + x, y: tile.position.y + y} end)
      |> Enum.filter(&in_bounds?/1)
      |> Enum.map(&tile_at(map_sheet, &1))
  end

  @doc """
  Returns the nth column of the grid
  """
  @spec column(MapSheet.t(), integer) :: list(Tile.t())
  def column(map_sheet, n), do: Enum.at(map_sheet.tiles, n)

  @doc """
  Returns the nth row of the grid
  """
  @spec row(MapSheet.t(), integer) :: list(Tile.t())
  def row(map_sheet, n), do: Enum.map(map_sheet.tiles, fn (column) -> Enum.at(column, n) end)

  @doc """
  Returns all columns of the given map sheet
  """
  @spec columns(MapSheet.t()) :: list(list(Tile.t()))
  def columns(map_sheet), do: 0 .. 10 |> Enum.map(&column(map_sheet, &1))

  @doc """
  Returns all rows of the given map sheet
  """
  @spec rows(MapSheet.t()) :: list(list(Tile.t()))
  def rows(map_sheet), do: 0 .. 10 |> Enum.map(&row(map_sheet, &1))


  @doc """
  Returns all tiles that has the specified material
  """
  @spec tiles_by_material(MapSheet.t(), Game.material()) :: list(Tile.t())
  def tiles_by_material(map_sheet, material) do
    map_sheet.tiles
    |> List.flatten()
    |> Enum.filter(&(&1.material == material))
  end
end
