defmodule Cartographers.GameEngine.ShapeTest do
  use ExUnit.Case
  alias Cartographers.GameEngine.Shape

  doctest Shape

  test "can be created with Shape.make/1" do
    %Shape{width: width, height: height, definition: definition} = Shape.make("""
    .#
    ##
    #.
    """)

    assert width == 2
    assert height == 3
    assert definition == [
      [false, true],
      [true, true],
      [true, false]
    ]

    %Shape{width: width, height: height, definition: definition} = Shape.make("#")

    assert width == 1
    assert height == 1
    assert definition == [[true]]
  end

  test "cannot be created with Shape.make/1 if given an empty string" do
    assert_raise ArgumentError, fn -> %Shape{} = Shape.make("") end
  end

  test "cannot be created with Shape.make/1 if given something else than a string" do
    assert_raise ArgumentError, fn -> %Shape{} = Shape.make(nil) end
    assert_raise ArgumentError, fn -> %Shape{} = Shape.make(1) end
    assert_raise ArgumentError, fn -> %Shape{} = Shape.make(%{}) end
    assert_raise ArgumentError, fn -> %Shape{} = Shape.make({}) end
    assert_raise ArgumentError, fn -> %Shape{} = Shape.make([]) end
  end

  test "shape can be rotated clockwise" do
    shape = Shape.make("""
    .#.
    .#.
    ###
    """)

    %Shape{width: width, height: height, definition: definition} = Shape.rotate_clockwise(shape)

    assert width == 3
    assert height == 3
    assert definition == [
      [true, false, false],
      [true, true, true],
      [true, false, false],
    ]

    shape = Shape.make("""
    .#
    .#
    ##
    """)

    %Shape{width: width, height: height, definition: definition} = Shape.rotate_clockwise(shape)

    assert width == 3
    assert height == 2
    assert definition == [
      [true, false, false],
      [true, true, true],
    ]
  end

  test "shape can be rotated counter clockwise" do
    shape = Shape.make("""
    .#.
    .#.
    ###
    """)

    %Shape{width: width, height: height, definition: definition} = Shape.rotate_counterclockwise(shape)

    assert width == 3
    assert height == 3
    assert definition == [
      [false, false, true],
      [true, true, true],
      [false, false, true],
    ]

    shape = Shape.make("""
    .#
    .#
    ##
    """)

    %Shape{width: width, height: height, definition: definition} = Shape.rotate_counterclockwise(shape)

    assert width == 3
    assert height == 2
    assert definition == [
      [true, true, true],
      [false, false, true],
    ]
  end

  test "shape can be flipped horizontally" do
    shape = Shape.make("""
    #.
    ##
    .#
    """)

    %Shape{width: width, height: height, definition: definition} = Shape.flip_horizontally(shape)

    assert width == 2
    assert height == 3
    assert definition == [
      [false, true],
      [true, true],
      [true, false]
    ]

    shape = Shape.make("""
    ..#
    .##
    ##.
    """)

    %Shape{width: width, height: height, definition: definition} = Shape.flip_horizontally(shape)

    assert width == 3
    assert height == 3
    assert definition == [
      [true, false, false],
      [true, true, false],
      [false, true, true],
    ]
  end

  test "shape can be flipped vertically" do
    shape = Shape.make("""
    ..#
    .##
    ##.
    """)

    %Shape{width: width, height: height, definition: definition} = Shape.flip_vertically(shape)

    assert width == 3
    assert height == 3
    assert definition == [
      [true, true, false],
      [false, true, true],
      [false, false, true],
    ]

    shape = Shape.make("""
    #.
    ##
    .#
    """)

    %Shape{width: width, height: height, definition: definition} = Shape.flip_vertically(shape)

    assert width == 2
    assert height == 3
    assert definition == [
      [false, true],
      [true, true],
      [true, false]
    ]
  end

  test "Shape rotation left and rotation right correlation" do
    shape = Shape.make("""
    #.#
    .##
    #..
    """)

    assert Shape.rotate_clockwise(shape) == (
      shape
      |> Shape.rotate_counterclockwise
      |> Shape.rotate_counterclockwise
      |> Shape.rotate_counterclockwise
    )

    assert Shape.rotate_counterclockwise(shape) == (
      shape
      |> Shape.rotate_clockwise
      |> Shape.rotate_clockwise
      |> Shape.rotate_clockwise
    )
  end

  test "Shape.all_variants/1" do
    shape = Shape.make("""
    ##.
    ...
    ...
    """)

    expected = Enum.map([
      """
      ##.
      ...
      ...
      """,
      """
      #..
      #..
      ...
      """,
      """
      ...
      #..
      #..
      """,
      """
      ...
      ...
      ##.
      """,
      """
      ...
      ...
      .##
      """,
      """
      ...
      ..#
      ..#
      """,
      """
      ..#
      ..#
      ...
      """,
      """
      .##
      ...
      ...
      """,
    ], &Shape.make/1) |> MapSet.new |> Enum.to_list

    assert Shape.all_variants(shape) |> Enum.to_list == expected
  end
end
