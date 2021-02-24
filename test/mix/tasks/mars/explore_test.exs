defmodule Mix.Tasks.Mars.ExploreTest do
  use ExUnit.Case, async: true
  import ExUnit.CaptureIO
  import Mock

  describe "run/1" do
    test "renders error when file is not given" do
      results =
        capture_io(:stderr, fn ->
          Mix.Tasks.Mars.Explore.run([])
        end)
        |> String.trim()

      assert results == "You need to specify a file path."
    end

    test "process the file" do
      file_path = "path/to/file.txt"

      with_mock Cli, run: fn ^file_path -> :ok end do
        assert called(Cli.run(file_path))
      end
    end
  end
end
