defmodule Cartographers.GameEngine.Game do

  defmodule Season do
    @moduledoc """
    A structure representing the four seasons, each season constists of a time threshold and a
    set of references to active edicts which are resolved when total sum of explore cards reaches
    the specified threshold.
    """
    @enforce_keys [:name, :time_threshold, :active_edicts]
    @type t :: %__MODULE__{
        name:           :spring | :summer | :autumn | :winter,
        time_threshold: integer,
        active_edicts:  tuple,
    }
    defstruct [:name, :time_threshold, :active_edicts]

    @spec all :: list(Season.t)
    def all, do: [
      %Season{ name: :spring, time_threshold: 8, active_edicts: {:a, :b}},
      %Season{ name: :summer, time_threshold: 8, active_edicts: {:b, :c}},
      %Season{ name: :autumn, time_threshold: 7, active_edicts: {:c, :d}},
      %Season{ name: :winter, time_threshold: 6, active_edicts: {:d, :a}}
    ]
  end
end
