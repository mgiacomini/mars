defmodule MarsTest do
  use ExUnit.Case

  describe "explore/3" do
    test "returns the probe in the final position" do
      topology = %Mars.Topology{x: 5, y: 5}
      probe = %Mars.Probe{x: 0, y: 0, direction: :north}
      movements = ["M", "M", "L", "R"]

      assert {:ok, %Mars.Probe{} = probe} = Mars.explore(topology, probe, movements)
      assert probe.y == 2
      assert probe.x == 0
      assert probe.direction == :north
    end

    test "returns an error when the final probe position is outside from topology" do
      topology = %Mars.Topology{x: 1, y: 1}

      probe = %Mars.Probe{x: 0, y: 0, direction: :north}
      assert {:error, "Invalid movement"} == Mars.explore(topology, probe, ["M", "M"])

      probe = %Mars.Probe{x: 0, y: 0, direction: :south}
      assert {:error, "Invalid movement"} == Mars.explore(topology, probe, ["M"])

      probe = %Mars.Probe{x: 0, y: 0, direction: :east}
      assert {:error, "Invalid movement"} == Mars.explore(topology, probe, ["M", "M"])

      probe = %Mars.Probe{x: 0, y: 0, direction: :west}
      assert {:error, "Invalid movement"} == Mars.explore(topology, probe, ["M"])
    end
  end
end
