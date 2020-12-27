defmodule Cartographers.GameEngine.MapSheet do
  @moduledoc """
  Representation of the map sheet that every player receives at the beggining of the game
  """
  @enforce_keys [:tiles, :mountains, :ruins]
  @type t :: %__MODULE__{
    tiles: list(list(Tile.t)), # A 11x11 matrix of tiles representing the paper sheet
    ruins: list(Position.t)
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
      position: Position.t
    }
    defstruct [:material, :position]

    @type material :: :empty | :forest | :village | :farm | :water | :monster | :mountain
  end
end
