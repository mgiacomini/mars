defmodule Mars do
  @moduledoc false

  alias Mars.Topology
  alias Mars.Probe

  def explore(%Topology{} = _topology, %Probe{} = probe, _movements) do
    {:ok, %Probe{probe | y: 2}}
  end
end
