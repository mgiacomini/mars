defmodule CliTest do
  use ExUnit.Case
  import ExUnit.CaptureIO

  describe "run/1" do
    test "raises an error when file doesn't exists" do
      assert_raise File.Error, fn ->
        Cli.run("invalid.txt")
      end
    end

    test "prints the results" do
      result =
        capture_io(fn ->
          :ok = Cli.run("test/support/input_001.txt")
        end)

      expected_result = """
      1 3 N
      5 1 E
      """

      assert expected_result == result
    end
  end
end
