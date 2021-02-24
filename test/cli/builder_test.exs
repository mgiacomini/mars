defmodule Cli.BuilderTest do
  use ExUnit.Case

  alias Cli.Builder
  alias Mars.Probe
  alias Mars.Topology

  describe "build_topology/1" do
    test "returns a topology struct" do
      assert %Topology{x: 5, y: 5} == Builder.build_topology(" 5 5 \n")
    end
  end

  describe "build_probe/1" do
    @moves "MMLR"

    test "returns a tuple with probe and moves" do
      expected_moves = ["M", "M", "L", "R"]
      assert {%Probe{}, ^expected_moves} = Builder.build_probe([" 5 5 N\n", @moves])
    end

    test "builds a probe with x and y axis" do
      assert {probe, _moves} = Builder.build_probe([" 5 5 N\n", @moves])
      assert probe.x == 5
      assert probe.y == 5
    end

    test "builds a probe with a valid direction" do
      assert {probe, _moves} = Builder.build_probe([" 5 5 N\n", @moves])
      assert probe.direction == :north

      assert {probe, _moves} = Builder.build_probe([" 5 5 S\n", @moves])
      assert probe.direction == :south

      assert {probe, _moves} = Builder.build_probe([" 5 5 W\n", @moves])
      assert probe.direction == :west

      assert {probe, _moves} = Builder.build_probe([" 5 5 E\n", @moves])
      assert probe.direction == :east
    end
  end
end
