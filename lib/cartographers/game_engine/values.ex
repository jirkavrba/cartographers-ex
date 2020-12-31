defmodule Cartographers.GameEngine.Values do
  @moduledoc """
  This module contains all values and configurations for the game
  """

  # TODO: Add translations from the english version of the game (translations will be then done on the client side)

  alias Cartographers.GameEngine.Game
  alias Cartographers.GameEngine.Cards
  alias Cartographers.GameEngine.Shape
  alias Cartographers.GameEngine.ScoringRules

  def seasons do
    [
      %Game.Season{name: "Spring", time_threshold: 8, active_edicts: [:a, :b]},
      %Game.Season{name: "Summer", time_threshold: 8, active_edicts: [:b, :c]},
      %Game.Season{name: "Autumn", time_threshold: 7, active_edicts: [:c, :d]},
      %Game.Season{name: "Winter", time_threshold: 6, active_edicts: [:d, :a]}
    ]
  end

  def explore_cards do
    [
      %Cards.ExploreCard{
        name: "Říčka v polích",
        variants: [
          %Cards.ExploreCard.ExploreCardVariant{
            shape: Shape.make("""
            ###
            #..
            #..
            """),
            material: :farm,
            coin_reward: false
          },
          %Cards.ExploreCard.ExploreCardVariant{
            shape: Shape.make("""
            ###
            #..
            #..
            """),
            material: :water,
            coin_reward: false
          }
        ],
        time_value: 2
      },
      %Cards.ExploreCard{
        name: "Víska ve větvích",
        variants: [
          %Cards.ExploreCard.ExploreCardVariant{
            shape: Shape.make("""
            ..##
            ###.
            """),
            material: :forest,
            coin_reward: false
          },
          %Cards.ExploreCard.ExploreCardVariant{
            shape: Shape.make("""
            ..##
            ###.
            """),
            material: :village,
            coin_reward: false
          }
        ],
        time_value: 2
      },
      %Cards.ExploreCard{
        name: "Bažiny",
        variants: [
          %Cards.ExploreCard.ExploreCardVariant{
            shape: Shape.make("""
            #..
            ###
            #..
            """),
            material: :forest,
            coin_reward: false
          },
          %Cards.ExploreCard.ExploreCardVariant{
            shape: Shape.make("""
            #..
            ###
            #..
            """),
            material: :water,
            coin_reward: false
          }
        ],
        time_value: 2
      },
      %Cards.ExploreCard{
        name: "Trhliny v prostoru",
        variants: [
          %Cards.ExploreCard.ExploreCardVariant{
            shape: Shape.make("#"),
            material: :forest,
            coin_reward: false
          },
          %Cards.ExploreCard.ExploreCardVariant{
            shape: Shape.make("#"),
            material: :village,
            coin_reward: false
          },
          %Cards.ExploreCard.ExploreCardVariant{
            shape: Shape.make("#"),
            material: :farm,
            coin_reward: false
          },
          %Cards.ExploreCard.ExploreCardVariant{
            shape: Shape.make("#"),
            material: :water,
            coin_reward: false
          },
          %Cards.ExploreCard.ExploreCardVariant{
            shape: Shape.make("#"),
            material: :monster,
            coin_reward: false
          }
        ],
        time_value: 0
      },
      %Cards.ExploreCard{
        name: "Veletok",
        time_value: 1,
        variants: [
          %Cards.ExploreCard.ExploreCardVariant{
            shape: Shape.make("""
            #
            #
            #
            """),
            material: :water,
            coin_reward: true
          },
          %Cards.ExploreCard.ExploreCardVariant{
            shape: Shape.make("""
            ..#
            .##
            ##.
            """),
            material: :water,
            coin_reward: false
          }
        ]
      },
      %Cards.ExploreCard{
        name: "Ovocný sad",
        time_value: 2,
        variants: [
          %Cards.ExploreCard.ExploreCardVariant{
            material: :forest,
            shape: Shape.make("""
            ###
            ..#
            """),
            coin_reward: false
          },
          %Cards.ExploreCard.ExploreCardVariant{
            material: :farm,
            shape: Shape.make("""
            ###
            ..#
            """),
            coin_reward: false
          }
        ]
      },
      %Cards.ExploreCard{
        name: "Les zapomnění",
        time_value: 1,
        variants: [
          %Cards.ExploreCard.ExploreCardVariant{
              material: :forest,
              shape: Shape.make("""
              #.
              .#
              """),
              coin_reward: true
          },
          %Cards.ExploreCard.ExploreCardVariant{
              material: :forest,
              shape: Shape.make("""
              #.
              ##
              .#
              """),
              coin_reward: false
          }
        ]
      },
      %Cards.ExploreCard{
        name: "Hospodářství",
        time_value: 2,
        variants: [
          %Cards.ExploreCard.ExploreCardVariant{
              material: :village,
              shape: Shape.make("""
              #.
              ##
              #.
              """),
              coin_reward: false
          },
          %Cards.ExploreCard.ExploreCardVariant{
              material: :farm,
              shape: Shape.make("""
              #.
              ##
              #.
              """),
              coin_reward: false
          }
        ]
      },
      %Cards.ExploreCard{
        name: "Zemědělská půda",
        time_value: 1,
        variants: [
          %Cards.ExploreCard.ExploreCardVariant{
            material: :farm,
            shape: Shape.make("""
            #
            #
            """),
            coin_reward: true
          },
          %Cards.ExploreCard.ExploreCardVariant{
            material: :farm,
            shape: Shape.make("""
            .#.
            ###
            .#.
            """),
            coin_reward: false
          }
        ]
      },
      %Cards.ExploreCard{
        name: "Rybářská osada",
        time_value: 2,
        variants: [
          %Cards.ExploreCard.ExploreCardVariant{
            material: :village,
            shape: Shape.make("####"),
            coin_reward: false
          },
          %Cards.ExploreCard.ExploreCardVariant{
            material: :water,
            shape: Shape.make("####"),
            coin_reward: false
          }
        ]
      }
    ]
  end

  @spec monster_cards :: list(Cards.MonsterCard.t())
  def monster_cards do
    [
      %Cards.MonsterCard{
        name: "Útok goblinů",
        shape: Shape.make("""
        #..
        .#.
        ..#
        """),
        rotation_direction: :counter_clockwise
      },
      %Cards.MonsterCard{
        name: "Přepadení krysodlaky",
        shape: Shape.make("###"),
        rotation_direction: :clockwise
      },
      %Cards.MonsterCard{
        name: "Výpad koboldů",
        shape: Shape.make("""
        #.
        ##
        #.
        """),
        rotation_direction: :clockwise
      },
      %Cards.MonsterCard{
        name: "Invaze mozkožroutů",
        shape: Shape.make("""
        #.
        ##
        """),
        rotation_direction: :counter_clockwise
      },
      %Cards.MonsterCard{
        name: "Rojení hmyzáků",
        shape: Shape.make("""
        .#
        ##
        #.
        """),
        rotation_direction: :clockwise
      },
      %Cards.MonsterCard{
        name: "Nájezd gobrů",
        shape: Shape.make("""
        #.#
        #.#
        """),
        rotation_direction: :clockwise
      },
      %Cards.MonsterCard{
        name: "Řádění zlobrů",
        shape: Shape.make("""
        ##
        ##
        """),
        rotation_direction: :counter_clockwise
      },
      %Cards.MonsterCard{
        name: "Vpád gnolů",
        shape: Shape.make("""
        ##
        #.
        ##
        """),
        rotation_direction: :counter_clockwise
      },
    ]
  end

  @spec ruins_cards :: list(Cards.RuinsCard.t())
  def ruins_cards do
    [
      %Cards.RuinsCard{ name: "Zřícená pevnost" },
      %Cards.RuinsCard{ name: "Zřícený chrám" },
    ]
  end

  @spec edict_cards :: %{ (:a | :b | :c | :d) => ScoringRules.t() }
  def edict_cards do
    %{
      a: [
        ScoringRules.Greenbough,
        ScoringRules.SentinelWood,
        ScoringRules.StonesideForest,
        ScoringRules.Treetower,
      ],
      b: [
        ScoringRules.CanalLake,
        ScoringRules.MagesValley,
        ScoringRules.ShoresideExpanse,
        ScoringRules.TheGoldenGranary,
      ],
      c: [
        ScoringRules.GreatCity,
        ScoringRules.GreengoldPlains,
        ScoringRules.Shieldgate,
        ScoringRules.Wildholds,
      ],
      d: [
        ScoringRules.Borderlands,
        ScoringRules.LostBarony,
        ScoringRules.TheBrokenRoad,
        ScoringRules.TheCauldrons,
      ]
    }
  end
end
