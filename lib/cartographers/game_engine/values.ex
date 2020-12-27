defmodule Cartographers.GameEngine.Values do
  @moduledoc """
  This module contains all values and configurations for the game
  """

  alias Cartographers.GameEngine.Game

  def seasons do
    [
      %Game.Season{ name: "Spring", time_threshold: 8, active_edicts: [:a, :b] },
      %Game.Season{ name: "Summer", time_threshold: 8, active_edicts: [:b, :c] },
      %Game.Season{ name: "Autumn", time_threshold: 7, active_edicts: [:c, :d] },
      %Game.Season{ name: "Winter", time_threshold: 6, active_edicts: [:d, :a] }
    ]
  end
end
