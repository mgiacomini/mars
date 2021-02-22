defmodule Mars.Topology do
  @type t :: %__MODULE__{
          x: integer(),
          y: integer()
        }

  defstruct x: 0, y: 0

  alias Mars.Topology
  alias Mars.Probe

  @spec valid_position?(Topology.t(), Probe.t()) :: boolean()
  def valid_position?(%Topology{} = topology, %Probe{} = probe) do
    probe.x >= 0 and probe.y >= 0 and topology.x >= probe.x and topology.y >= probe.y
  end
end
