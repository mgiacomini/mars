defmodule Mars.MixProject do
  use Mix.Project

  def project do
    [
      app: :mars,
      version: "0.1.0",
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {Mars.Application, []}
    ]
  end

  defp deps do
    []
  end
end
