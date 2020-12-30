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

  @doc """
  Provides a handy way of constructing shapes. Takes string as an input that can look like:

  .#
  ##
  #.

  which constructs a shape

  %Shape{
    width: 2,
    height: 3,
    definition: [
      [false, true],
      [true, true],
      [true, false]
    ]
  }

  """
  @spec make(String.t) :: Shape.t
  def make(""), do: raise ArgumentError
  def make(input) when is_binary(input) do
    rows = String.trim(input) |> String.split("\n")
    %__MODULE__{
      width: List.first(rows) |> String.length,
      height: Enum.count(rows),
      definition: Enum.map(rows, fn (row) -> String.graphemes(row) |> Enum.map(fn (point) -> point == "#" end) end)
    }
  end
  def make(_), do: raise ArgumentError

  alias Cartographers.Utilities.ListRotations

  @doc """
  Rotates a given shape clockwise
  For example given:

  .#.
  .#.
  ###

  The returned shape will be:

  #..
  ###
  #..

  """
  @spec rotate_clockwise(Shape.t()) :: Shape.t()
  def rotate_clockwise(original) do
    %__MODULE__{
      width: original.height,
      height: original.width,
      definition: ListRotations.rotate_right(original.definition)
    }
  end

  @doc """
  Rotates a given shape counter-clockwise
  For example given:

  .#.
  .#.
  ###

  The returned shape will be:

  ..#
  ###
  ..#

  """
  @spec rotate_counterclockwise(Shape.t()) :: Shape.t()
  def rotate_counterclockwise(original) do
    %__MODULE__{
      width: original.height,
      height: original.width,
      definition: ListRotations.rotate_left(original.definition)
    }
  end

  @doc """
  Flips a given shape horizontally
  For example given:

  #..
  ###
  #..

  The returned shape will be:

  ..#
  ###
  ..#

  """
  @spec flip_horizontally(Shape.t()) :: Shape.t()
  def flip_horizontally(original) do
    %{original | definition: original.definition |> Enum.map(&Enum.reverse/1)}
  end

  @doc """
  Flips a given shape vertically
  For example given:

  .#.
  .#.
  ###

  The returned shape will be:

  ###
  .#.
  .#.

  """
  @spec flip_vertically(Shape.t()) :: Shape.t()
  def flip_vertically(original) do
    %{original | definition: original.definition |> Enum.reverse}
  end
end