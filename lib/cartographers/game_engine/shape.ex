defmodule Cartographers.GameEngine.Shape do
  @moduledoc """
  Wrapper around grid shape that can be later placed on a map sheet
  The definition is represented as a 2D list:

  ..##
  ###.

  would be represented as:
  [
    [false, false, true, true],
    [true, true, true, false]
  ]
  """
  @enforce_keys [:width, :height, :definition]
  @type t :: %__MODULE__{
          width: integer,
          height: integer,
          definition: list(list(boolean))
        }
  defstruct [:width, :height, :definition]
end
