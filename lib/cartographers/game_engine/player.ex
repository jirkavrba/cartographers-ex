defmodule Cartographers.GameEngine.Player do
  @moduledoc """
  Module wrapping around players.
  Each player owns a board.
  """

  @type t :: %__MODULE__{
    id:       integer,
    username: String.t(),
    board:    Board.t()
  }

  defstruct [:id, :username, :board]
end
