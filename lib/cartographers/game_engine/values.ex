defmodule Cartographers.GameEngine.Values do
  @moduledoc """
  This module contains all values and configurations for the game
  """

  alias Cartographers.GameEngine.Game
  alias Cartographers.GameEngine.Cards
  alias Cartographers.GameEngine.Shape

  def seasons do
    [
      %Game.Season{ name: "Spring", time_threshold: 8, active_edicts: [:a, :b] },
      %Game.Season{ name: "Summer", time_threshold: 8, active_edicts: [:b, :c] },
      %Game.Season{ name: "Autumn", time_threshold: 7, active_edicts: [:c, :d] },
      %Game.Season{ name: "Winter", time_threshold: 6, active_edicts: [:d, :a] }
    ]
  end

  def explore_cards do
    [
      %Cards.ExploreCard{
        name: "Říčka v polích",
        variants: [
          %Cards.ExploreCard.ExploreCardVariant{
            shape: %Shape{
              width: 3,
              height: 3,
              definition: [
                [true, true, true],
                [true, false, false],
                [true, false, false]
              ]
            },
            material: :farm,
            coin_reward: false
          },

          %Cards.ExploreCard.ExploreCardVariant{
            shape: %Shape{
              width: 3,
              height: 3,
              definition: [
                [true, true, true],
                [true, false, false],
                [true, false, false]
              ]
            },
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
            shape: %Shape{
              width: 4,
              height: 2,
              definition: [
                [false, false, true, true],
                [true, true, true, false],
              ]
            },
            material: :forest,
            coin_reward: false
          },

          %Cards.ExploreCard.ExploreCardVariant{
            shape: %Shape{
              width: 4,
              height: 2,
              definition: [
                [false, false, true, true],
                [true, true, true, false],
              ]
            },
            material: :village,
            coin_reward: false
          },
        ],
        time_value: 2
      },
      %Cards.ExploreCard{
        name: "Bažiny",
        variants: [
          %Cards.ExploreCard.ExploreCardVariant{
            shape: %Shape{
              width: 3,
              height: 3,
              definition: [
                [true, false, false],
                [true, true, true],
                [true, false, false],
              ]
            },
            material: :forest,
            coin_reward: false
          },

          %Cards.ExploreCard.ExploreCardVariant{
            shape: %Shape{
              width: 3,
              height: 3,
              definition: [
                [true, false, false],
                [true, true, true],
                [true, false, false],
              ]
            },
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
              shape: %Shape{
                width: 1,
                height: 1,
                definition: [[true]]
              },
              material: :forest,
              coin_reward: false
          },
          %Cards.ExploreCard.ExploreCardVariant{
              shape: %Shape{
                width: 1,
                height: 1,
                definition: [[true]]
              },
              material: :village,
              coin_reward: false
          },
          %Cards.ExploreCard.ExploreCardVariant{
              shape: %Shape{
                width: 1,
                height: 1,
                definition: [[true]]
              },
              material: :farm,
              coin_reward: false
          },
          %Cards.ExploreCard.ExploreCardVariant{
              shape: %Shape{
                width: 1,
                height: 1,
                definition: [[true]]
              },
              material: :water,
              coin_reward: false
          },
          %Cards.ExploreCard.ExploreCardVariant{
              shape: %Shape{
                width: 1,
                height: 1,
                definition: [[true]]
              },
              material: :monster,
              coin_reward: false
          },
        ],
        time_value: 0
      },
      %Cards.ExploreCard{
        name: "Veletok",
        time_value: 1,
        variants: [
          %Cards.ExploreCard.ExploreCardVariant{
            shape: %Shape{
              width: 1,
              height: 3,
              definition: [
                [true],
                [true],
                [true]
              ]
            },
            material: :water,
            coin_reward: true
          },

          %Cards.ExploreCard.ExploreCardVariant{
            shape: %Shape{
              width: 3,
              height: 3,
              definition: [
                [false, false, true],
                [false, true, true],
                [true, true, false]
              ]
            },
            material: :water,
            coin_reward: false
          }
        ]
      }
    ]
  end
end
