defmodule Cli.Builder do
  @moduledoc false

  alias Mars.Probe
  alias Mars.Topology

  @spec build_topology(String.t()) :: Topology.t()
  def build_topology(header) do
    [x, y] = split_args(header)
    %Topology{x: String.to_integer(x), y: String.to_integer(y)}
  end

  @spec build_probe(list(String.t())) :: {Probe.t(), list(String.t())}
  def build_probe([header, moves]) do
    [x, y, dir] = split_args(header)

    probe = %Probe{
      x: String.to_integer(x),
      y: String.to_integer(y),
      direction: parse_direction(dir)
    }

    {probe, String.graphemes(moves)}
  end

  defp parse_direction("N"), do: :north
  defp parse_direction("S"), do: :south
  defp parse_direction("W"), do: :west
  defp parse_direction("E"), do: :east

  defp split_args(line), do: line |> String.trim() |> String.split(" ")
end
