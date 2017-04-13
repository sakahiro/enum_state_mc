defmodule EnumStateMc.Mixfile do
  use Mix.Project

  require IEx

  def project do
    [
      app: :enum_state_mc,
      version: "0.1.0",
      elixir: "~> 1.4",
      elixirc_pathes: elixirc_pathes(Mix.env),
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      deps: deps()
    ]
  end

  IEx.pry

  defp elixirc_pathes(_), do: elixirc_pathes() ++ ["test/dummy"]
  defp elixirc_pathes(), do: ["lib"]

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    # Specify extra applications you'll use from Erlang/Elixir
    [extra_applications: [:logger]]
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
      {:ecto, ">= 2.0.0"},

      {:postgrex,   ">= 0.0.0", only: :test},
      {:ex_machina, "~> 2.0", only: :test},
      {:espec, "~> 1.3.4", only: :test},

      {:ex_doc, "~> 0.14", only: :dev, runtime: false}
    ]
  end
end
