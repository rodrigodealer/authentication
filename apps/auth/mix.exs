defmodule RestApi.Mixfile do
  use Mix.Project

  def project do
    [app: :auth,
     version: "0.0.1",
     deps_path: "../../deps",
     lockfile: "../../mix.lock",
     elixir: "~> 1.0",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  def application do
    [applications: [:logger, :cowboy, :plug, :httpoison, :mariaex]]
  end

  defp deps do
    [{:cowboy, "~> 1.0.0"}, 
    {:plug, "~> 0.8.2"},
    {:mariaex, "~> 0.4.2"},
    {:poison,   "~> 1.4.0"},
    {:httpoison, "~> 0.6"}]
  end
end
