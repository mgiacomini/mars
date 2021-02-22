defmodule Mars.TopologyTest do
  use ExUnit.Case

  alias Mars.Probe
  alias Mars.Topology

  describe "valid_position?/2" do
    test "returns true when probe is inside the topology" do
      topology = %Topology{x: 5, y: 5}

      probe = %Probe{x: 5, y: 5}
      assert Topology.valid_position?(topology, probe)

      probe = %Probe{x: 4, y: 5}
      assert Topology.valid_position?(topology, probe)

      probe = %Probe{x: 0, y: 0}
      assert Topology.valid_position?(topology, probe)
    end

    test "returns false when probe is outside the topology" do
      topology = %Topology{x: 5, y: 5}

      probe = %Probe{x: 6, y: 5}
      refute Topology.valid_position?(topology, probe)

      probe = %Probe{x: 5, y: 6}
      refute Topology.valid_position?(topology, probe)

      probe = %Probe{x: 6, y: 6}
      refute Topology.valid_position?(topology, probe)

      probe = %Probe{x: -1, y: 0}
      refute Topology.valid_position?(topology, probe)

      probe = %Probe{x: 0, y: -1}
      refute Topology.valid_position?(topology, probe)
    end
  end
end
