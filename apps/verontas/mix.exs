defmodule Verontas.MixProject do
  use Mix.Project

  def project do
    [
      app: :verontas,
      version: "0.1.0",
      build_path: "../../_build",
      config_path: "../../config/config.exs",
      deps_path: "../../deps",
      lockfile: "../../mix.lock",
      elixir: "~> 1.5",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [:phoenix, :gettext] ++ Mix.compilers(),
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps(),
      grisp: grisp()
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {Verontas.Application, []},
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:phoenix, "~> 1.4.9"},
      {:phoenix_pubsub, "~> 1.1"},
      {:phoenix_ecto, "~> 4.0"},
      {:ecto_sql, "~> 3.1"},
      {:postgrex, ">= 0.0.0"},
      {:phoenix_html, "~> 2.11"},
      {:phoenix_live_reload, "~> 1.2", only: :dev},
      {:gettext, "~> 0.11"},
      {:jason, "~> 1.0"},
      {:plug_cowboy, "~> 2.0"},

      ## 
      # Nosos
      ##

      # {:grisp, "~> 1.1.4"},
      {:grisp, git: "https://github.com/grisp/grisp.git", tag: "master"},
      {:grisp_emulation, git: "https://github.com/grisp/grisp_emulation.git", tag: "master"},
      {:epmd, git: "https://github.com/erlang/epmd", tag: "4d1a59"},
      {:lasp, git: "https://github.com/Laymer/lasp", tag: "feature-logger"},
      {:mix_grisp, "~> 0.1.0", only: :dev}
    ]
  end

#   { deps , [
#     % {grisp , {git , "https://github.com/GrispLasp/grisp.git" , {branch , "master"}}} ,
#     {grisp , {git , "https://github.com/grisp/grisp.git" , {branch , "master"}}} ,
#     % {grisp_emulation , {git , "https://github.com/grisp/grisp_emulation.git" , {branch , "master"}}} ,
#     % {grisp , {git , "https://github.com/GrispLasp/grisp.git" , {branch , "otp22-tests"}}} ,
#     % grisp,
#     {epmd , {git , "https://github.com/erlang/epmd" , {ref , "4d1a59"}}} ,
#     {lasp , {git , "https://github.com/Laymer/lasp.git" , {branch , "feature-logger"}}}
# ]}.


  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to create, migrate and run the seeds file at once:
  #
  #     $ mix ecto.setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    [
      "ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
      "ecto.reset": ["ecto.drop", "ecto.setup"],
      test: ["ecto.create --quiet", "ecto.migrate", "test"]
    ]
  end

  defp grisp do
      [
        # otp: [verson: "21.0"],
        otp: otpvsn(),
        deploy: [
          pre_script: "rm -rdf /Volumes/GRISP/*",
          destination: "/Volumes/GRISP",
          post_script: "diskutil unmount /Volumes/GRISP",
        ]        
      ]
  end

  defp otpvsn do
    [verson: "21.0"]
  end
end
