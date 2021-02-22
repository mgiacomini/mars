defmodule Mars.ProbeTest do
  use ExUnit.Case

  alias Mars.Probe

  describe "move/1" do
    test "move to north" do
      probe =
        %Probe{x: 0, y: 0, direction: :north}
        |> Probe.move()
        |> Probe.move()
        |> Probe.move()

      expected_probe = %Mars.Probe{x: 0, y: 3, direction: :north}
      assert probe == expected_probe
    end

    test "move to south" do
      probe =
        %Probe{x: 0, y: 0, direction: :south}
        |> Probe.move()
        |> Probe.move()
        |> Probe.move()

      expected_probe = %Mars.Probe{x: 0, y: -3, direction: :south}
      assert probe == expected_probe
    end

    test "move to west" do
      probe =
        %Probe{x: 0, y: 0, direction: :west}
        |> Probe.move()
        |> Probe.move()
        |> Probe.move()

      expected_probe = %Mars.Probe{x: -3, y: 0, direction: :west}
      assert probe == expected_probe
    end

    test "move to east" do
      probe =
        %Probe{x: 0, y: 0, direction: :east}
        |> Probe.move()
        |> Probe.move()
        |> Probe.move()

      expected_probe = %Mars.Probe{x: 3, y: 0, direction: :east}
      assert probe == expected_probe
    end
  end
end
