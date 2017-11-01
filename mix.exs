defmodule Snow.Mixfile do
  use Mix.Project

  def project do
    [
      app: :snow,
      version: "0.1.0",
      elixir: "~> 1.5",
      start_permanent: Mix.env == :prod,
      build_embedded: Mix.env == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      mod: {Snow, []},
      extra_applications: [:logger],
    ]
  end

  defp deps do
    []
  end
end
