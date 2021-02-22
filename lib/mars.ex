defmodule Mars do
  @moduledoc false

  alias Mars.Topology
  alias Mars.Probe

  def explore(%Topology{} = topology, %Probe{} = probe, movements) do
    probe =
      Enum.reduce(movements, probe, fn
        "M", probe -> Probe.move(probe)
        "L", probe -> Probe.rotate(probe, :left)
        "R", probe -> Probe.rotate(probe, :right)
      end)

    if valid_position?(topology, probe) do
      {:ok, probe}
    else
      {:error, "Invalid movement"}
    end
  end

  defp valid_position?(%Topology{} = topology, %Probe{} = probe) do
    probe.x >= 0 and probe.y >= 0 and topology.x >= probe.x and topology.y >= probe.y
  end
end
