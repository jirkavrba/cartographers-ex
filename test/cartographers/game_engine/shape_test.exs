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
    ##
    #.
    """)

    %Shape{width: width, height: height, definition: definition} = Shape.rotate_clockwise(shape)

    assert width == 3
    assert height == 2
    assert definition == [
      [true, true, false],
      [false, true, true],
    ]
  end
end
