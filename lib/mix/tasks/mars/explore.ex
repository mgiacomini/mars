defmodule Mix.Tasks.Mars.Explore do
  use Mix.Task

  @impl Mix.Task
  def run(args) do
    case List.first(args) do
      nil -> Mix.shell().error("You need to specify a file path.")
      file_path -> Cli.run(file_path)
    end
  end
end
