defmodule Cartographers.GameEngine.Player do
  @moduledoc """
  Each player has an unique ID, username (which is unique within every individual game).
  Also, every player has its own map sheet which can be accessed through this structure
  """
  @enforce_keys [:id, :username]
  @type t :: %__MODULE__{
    id: integer,
    username: String.t,
    map_sheet: MapSheet.t
  }
  defstruct [:id, :username, :map_sheet]
end
