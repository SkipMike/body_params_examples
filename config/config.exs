# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :appsignal_example,
  ecto_repos: [AppsignalExample.Repo]

# Configures the endpoint
config :appsignal_example, AppsignalExampleWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "h/Lzvyv5TZqr5yFjiWNF23ZGW9Pul6xgZs1WJ13HKlJhv8RZZLwhTKKGvYbsKl/o",
  render_errors: [view: AppsignalExampleWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: AppsignalExample.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
