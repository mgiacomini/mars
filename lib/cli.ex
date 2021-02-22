defmodule Cli do
  @moduledoc "Use this module to run the application from cli"

  alias Cli.Builder

  @spec run(String.t()) :: :ok
  def run(file_path) do
    {header, lines} =
      file_path
      |> File.read!()
      |> String.split("\n")
      |> Enum.map(&String.trim/1)
      |> List.pop_at(0)

    topology = Builder.build_topology(header)

    lines
    |> Enum.chunk_every(2)
    |> Enum.map(&Builder.build_probe/1)
    |> Enum.map(fn {probe, moves} ->
      Mars.explore(topology, probe, moves)
    end)
    |> Enum.each(&render_result/1)
  end

  ## Render functions

  defp render_result({:ok, probe}) do
    IO.puts("#{probe.x} #{probe.y} #{render_direction(probe.direction)}")
  end

  defp render_result({:error, reason}) do
    IO.puts(reason)
  end

  defp render_direction(:north), do: "N"
  defp render_direction(:south), do: "S"
  defp render_direction(:west), do: "W"
  defp render_direction(:east), do: "E"
end
