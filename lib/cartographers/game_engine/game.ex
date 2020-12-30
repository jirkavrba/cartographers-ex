defmodule Cartographers.GameEngine.Game do
  alias Cartographers.GameEngine.Player
  alias Cartographers.GameEngine.Cards

  @type season :: :spring | :summer | :autumn | :winter

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
      drawing_deck: list(Cards.ExploreCard | Cards.RuinsCard | Cards.MonsterCard),
      discard_deck: list(Cards.ExploreCard | Cards.RuinsCard | Cards.MonsterCard)
  }
  defstruct [:id, :players, :current_season, :picked_edict_cards, :drawing_deck, :discard_deck]
end
