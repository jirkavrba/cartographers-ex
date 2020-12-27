defmodule Cartographers.GameEngine.Game do

  @type t :: %__MODULE__{
    id: integer,
    players: list(Player.t)
  }

  defstruct [:id, :players]

end
