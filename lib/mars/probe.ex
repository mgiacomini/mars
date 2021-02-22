defmodule Mars.Probe do
  @moduledoc false

  @type direction :: :north | :south | :west | :east

  @type t :: %__MODULE__{
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

  @spec rotate(Mars.Probe.t(), :left | :right) :: Mars.Probe.t()
  def rotate(%__MODULE__{direction: :north} = probe, :left),
    do: %__MODULE__{probe | direction: :west}

  def rotate(%__MODULE__{direction: :west} = probe, :left),
    do: %__MODULE__{probe | direction: :south}

  def rotate(%__MODULE__{direction: :south} = probe, :left),
    do: %__MODULE__{probe | direction: :east}

  def rotate(%__MODULE__{direction: :east} = probe, :left),
    do: %__MODULE__{probe | direction: :north}

  def rotate(%__MODULE__{direction: :north} = probe, :right),
    do: %__MODULE__{probe | direction: :east}

  def rotate(%__MODULE__{direction: :east} = probe, :right),
    do: %__MODULE__{probe | direction: :south}

  def rotate(%__MODULE__{direction: :south} = probe, :right),
    do: %__MODULE__{probe | direction: :west}

  def rotate(%__MODULE__{direction: :west} = probe, :right),
    do: %__MODULE__{probe | direction: :north}
end
