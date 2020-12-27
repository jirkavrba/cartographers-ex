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
  end

end
