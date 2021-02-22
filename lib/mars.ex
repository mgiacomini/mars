defmodule Mars do
  @moduledoc false

  alias Mars.Topology
  alias Mars.Probe

  def explore(%Topology{} = _topology, %Probe{} = probe, movements) do
    {:ok, Enum.reduce(movements, probe, fn
      "M", probe -> Probe.move(probe)
      "L", probe -> Probe.rotate(probe, :left)
      "R", probe -> Probe.rotate(probe, :right)
    end)}
  end
end
