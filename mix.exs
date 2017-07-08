defmodule AlienCode.Mixfile do
  use Mix.Project

  def project do
    [
      app: :alien_code,
      version: "0.1.0",
      elixir: "~> 1.4",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      deps: deps(),
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: ["coveralls": :test, "coveralls.detail": :test, "coveralls.post": :test, "coveralls.html": :test]
    ]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    # Specify extra applications you'll use from Erlang/Elixir
    [applications: [:logger, :plug, :poison, :ecto, :cowboy, :postgrex],
     mod: {AlienCode, []}]
  end

  # Dependencies can be Hex packages:
  #
  #   {:my_dep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:my_dep, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:cowboy, "~> 1.1"},
      {:poison, "~> 3.1"},
      {:plug, "~> 1.3"},
      {:ecto, "~> 2.1"},
      {:postgrex, "~> 0.13.3"},
      {:comeonin, "~> 3.2"},
      {:credo, "~> 0.3", only: [:dev, :test]},
      {:excoveralls, "~> 0.7.1", only: [:test, :dev]}
    ]
  end
end
