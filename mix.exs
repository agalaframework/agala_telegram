defmodule Agala.Provider.Telegram.Mixfile do
  use Mix.Project

  def project do
    [
      app: :agala_telegram,
      version: "0.1.0",
      elixir: "~> 1.4",
      start_permanent: Mix.env == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :httpoison]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:agala, github: "agalaframework/agala", branch: "release/2.0.0"},
      {:httpoison, "~> 0.12"},
      {:poison, "~> 3.1"},
      {:ex_doc, "~> 0.16", only: :dev},
      {:inch_ex,"~> 0.5", only: :docs},
      {:credo, "~> 0.8", only: [:dev, :test]}
    ]
  end
end
