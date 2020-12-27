defmodule Cartographers.GameEngine.Cards do
  alias Cartographers.GameEngine.Shape

  defmodule ExploreCard do
    defmodule ExploreCardVariant do
      @moduledoc """
      Structure representing a variant contained within explore cards.
      Each card has multiple available variants (eg. same shape, but different material).
      Some variants can be rewarded with a coin, this is represented by the coin_rewards
      """
      @enforce_keys [:material, :shape, :coin_reward]
      @type t :: %__MODULE__{
              material: MapSheet.Tile.material(),
              shape: Shape.t(),
              coin_reward: boolean
            }
      defstruct [:material, :shape, :coin_reward]
    end

    @enforce_keys [:name, :variants, :time_value]
    @type t :: %__MODULE__{
            name: String.t(),
            variants: list(ExploreCardVariant.t()),
            time_value: integer
          }
    defstruct [:name, :variants, :time_value]
  end
end
