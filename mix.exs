defmodule Todoist.MixProject do
  use Mix.Project

  def project do
    [
      app: :ex_todoist,
      version: "1.0.5",
      elixir: "~> 1.10",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env() == :prod,
      description: description(),
      package: package(),
      deps: deps(),
      source_url: "https://github.com/l3co-Elixir/ex_todoist"
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp description() do
    "ex_todoist is a wrapper to todoist api."
  end

  defp package() do
    [
      name: "ex_todoist",
      files: ~w(lib .formatter.exs mix.exs README* LICENSE* CHANGELOG*),
      licenses: ["MIT License"],
      links: %{"GitHub" => "https://github.com/l3co-Elixir/ex_todoist"}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
      {:ex_doc, "~> 0.21.0", only: :dev, runtime: false},
      {:mock, "~> 0.3.5"},

      # http dependencies
      {:tesla, "~> 1.3.0"},
      {:hackney, "~> 1.15.2"},
      {:jason, ">= 1.0.0"},
      {:uuid, "~> 1.1"}
    ]
  end
end
