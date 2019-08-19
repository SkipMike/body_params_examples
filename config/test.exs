use Mix.Config

# Configure your database
config :appsignal_example, AppsignalExample.Repo,
  username: "postgres",
  password: "postgres",
  database: "appsignal_example_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :appsignal_example, AppsignalExampleWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
