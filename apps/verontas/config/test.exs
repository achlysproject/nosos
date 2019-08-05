use Mix.Config

# Configure your database
config :verontas, Verontas.Repo,
  username: "postgres",
  password: "postgres",
  database: "verontas_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :verontas, VerontasWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# config :grisp
#     include_erts: true,
#     include_src: false,
#     cookie: "MyCookie"