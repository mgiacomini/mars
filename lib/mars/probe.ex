defmodule Mars.Probe do

  @type direction() :: :north | :south | :west | :east

  @type t() :: %__MODULE__{
    x: integer(),
    y: integer(),
    direction: direction()
  }

  defstruct x: 0, y: 0, direction: :north

  @spec move(Mars.Probe.t()) :: Mars.Probe.t()
  def move(%__MODULE__{direction: :north} = probe), do: %__MODULE__{probe | y: probe.y + 1}
  def move(%__MODULE__{direction: :south} = probe), do: %__MODULE__{probe | y: probe.y - 1}
  def move(%__MODULE__{direction: :west} = probe), do: %__MODULE__{probe | x: probe.x - 1}
  def move(%__MODULE__{direction: :east} = probe), do: %__MODULE__{probe | x: probe.x + 1}
end
