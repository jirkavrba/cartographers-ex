defmodule Cartographers.GameEngine.Cards do
  alias Cartographers.GameEngine.Shape
  alias Cartographers.GameEngine.MapSheet

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

  defmodule EdictCard do
    @moduledoc """
    Edict cards specify scoring rules from categories A, B, C and D.
    At the end of every season, 2 edict cards are evaluated (which cards are evaluated depends on the current season) and
    it provides an integer score of every player based on his map sheet and the scoring rule implementation.
    """

    defmodule ScoringRule do
      @type t :: __MODULE__
      @doc """
      Calculates an integer score based on the board game cards (eg. 1 point for every row and column with a forest card).
      """
      @callback calculate_score(MapSheet.t()) :: integer
    end

    @enforce_keys [:category, :name, :rule]
    @type t ::%__MODULE__{
      category: :a | :b | :c | :d,
      name: String.t(),
      rule: ScoringRule.t()
    }
    defstruct [:category, :name, :rule]
  end
end
