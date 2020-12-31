defmodule Cartographers.GameEngine.Game do
  alias Cartographers.GameEngine.Player
  alias Cartographers.GameEngine.Cards
  alias Cartographers.GameEngine.Values

  @type season :: :spring | :summer | :autumn | :winter
  @type cards :: Cards.ExploreCard.t() | Cards.RuinsCard.t() | Cards.MonsterCard.t()

  defmodule Season do
    @moduledoc """
    A structure representing the four seasons, each season constists of a time threshold and a
    set of references to active edicts which are resolved when total sum of explore cards reaches
    the specified threshold.
    """
    @enforce_keys [:name, :time_threshold, :active_edicts]
    @type t :: %__MODULE__{
            name: Game.season,
            time_threshold: integer,
            active_edicts: tuple
          }
    defstruct [:name, :time_threshold, :active_edicts]
  end

  @enforce_keys [:id, :players, :current_season, :picked_edict_cards, :drawing_deck, :discard_deck]
  @type t :: %__MODULE__{
      id: integer,
      players: list(Player.t()),
      current_season: Game.season,
      picked_edict_cards: %{ a: Cards.EdictCard, b: Cards.EdictCard, c: Cards.EdictCard, d: Cards.EdictCard },
      drawing_deck: list(Game.cards),
      discard_deck: list(Game.cards)
  }
  defstruct [:id, :players, :current_season, :picked_edict_cards, :drawing_deck, :discard_deck]

  @spec pick_one(list) :: any
  defp pick_one(list) when is_list(list), do: list |> Enum.shuffle |> List.first

  @spec create_drawing_deck :: list(Game.cards)
  defp create_drawing_deck do
    Enum.shuffle(
      Values.explore_cards ++
      Values.ruins_cards ++
      [Values.monster_cards |> pick_one]
    )
  end

  @spec pick_edict_cards :: %{ (:a | :b | :c | :d) => Cards.EdictCard.ScoringRule.t() }
  defp pick_edict_cards do
    Values.edict_cards
    |> Enum.map(fn ({category, available_rules}) -> {category, available_rules |> pick_one} end)
    |> Enum.into(%{})
  end

  @spec create(list(Player.t())) :: Game.t()
  def create(players) do
    %__MODULE__{
      id: 0, # TODO: Add safe random number
      players: players,
      current_season: :spring,
      picked_edict_cards: pick_edict_cards(),
      drawing_deck: create_drawing_deck(),
      discard_deck: []
    }
  end
end
