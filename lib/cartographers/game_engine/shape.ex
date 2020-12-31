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

  import Cartographers.GameEngine.Utilities.MatrixRotations

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
      definition: rotate_right(original.definition)
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
      definition: rotate_left(original.definition)
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

  @doc """
  Produces all variants of the given shape.
  (Every possible shape that can be produced by rotating and flipping)
  """
  @spec all_variants(Shape.t()) :: MapSet.t(Shape.t())
  def all_variants(shape), do: MapSet.new([
    shape,
    shape |> flip_vertically,
    shape |> flip_horizontally,
    shape |> rotate_clockwise,
    shape |> rotate_counterclockwise,
    shape |> rotate_clockwise |> rotate_clockwise,
    shape |> rotate_clockwise |> flip_vertically,
    shape |> rotate_clockwise |> flip_horizontally,
    shape |> rotate_counterclockwise |> flip_vertically,
    shape |> rotate_counterclockwise |> flip_horizontally,
  ])

  @doc """
  Returns whether the two provided shapes are variants of each other
  """
  @spec is_variant_of?(Shape.t(), Shape.t()) :: boolean
  def is_variant_of?(original, other) do
    all_variants(original) |> Enum.member?(other)
  end
end
