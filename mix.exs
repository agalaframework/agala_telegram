defmodule Agala.Provider.Telegram.Mixfile do
  use Mix.Project

  def project do
    [
      app: :agala_telegram,
      version: "3.0.0",
      elixir: "~> 1.6",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      description: description(),
      package: package(),
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :tesla, :hackney]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:agala, "~> 3.0"},
      {:tesla, "~> 1.1.0"},
      {:hackney, "~> 1.13"},
      {:construct, "~> 1.0"},
      {:jason, "~> 1.1"},
      {:ex_doc, "> 0.0.0", only: :dev},
      {:inch_ex,"~> 0.5", only: :docs},
      {:credo, "~> 0.8", only: [:dev, :test]}
    ]
  end

  defp description do
    """
    Telegram provider for Agala framework.
    """
  end

  defp package do
    [
      maintainers: ["Dmitry Rubinstein"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/agalaframework/agala_telegram"},
      files: ~w(mix.exs README* CHANGELOG* lib)
    ]
  end
end
