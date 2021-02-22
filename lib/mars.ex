defmodule Mars do
  @moduledoc "Explore Mars using this module."

  alias Mars.Topology
  alias Mars.Probe

  @spec explore(Topology.t(), Probe.t(), any) :: {:error, String.t()} | {:ok, Probe.t()}
  def explore(%Topology{} = topology, %Probe{} = probe, movements) do
    probe =
      Enum.reduce(movements, probe, fn
        "M", probe -> Probe.move(probe)
        "L", probe -> Probe.rotate(probe, :left)
        "R", probe -> Probe.rotate(probe, :right)
      end)

    if Topology.valid_position?(topology, probe) do
      {:ok, probe}
    else
      {:error, "Invalid movement"}
    end
  end
end
