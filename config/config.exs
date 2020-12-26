# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :cartographers,
  ecto_repos: [Cartographers.Repo]

# Configures the endpoint
config :cartographers, CartographersWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "6zmLJ6tdCwHRiQvQh87RKH3WgHc1CscOjaAUd/NaIUay6veBJl62tUB4ucJFBqSx",
  render_errors: [view: CartographersWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Cartographers.PubSub,
  live_view: [signing_salt: "K1RylEJP"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
