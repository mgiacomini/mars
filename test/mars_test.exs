defmodule MarsTest do
  use ExUnit.Case

  describe "explore/3" do
    test "returns the probe in the final position" do
      topology = %Mars.Topology{x: 5, y: 5}
      probe = %Mars.Probe{x: 0, y: 0, direction: "N"}
      movements = "MMLR"

      assert {:ok, %Mars.Probe{} = probe} = Mars.explore(topology, probe, movements)
      assert probe.y == 2
      assert probe.x == 0
      assert probe.direction == "N"
    end
    test "returns an error when the position is invalid"
  end
end
