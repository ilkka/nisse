# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :nisse,
  ecto_repos: [Nisse.Repo]

# Configures the endpoint
config :nisse, NisseWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "KIwvMHurcwPGNKCi/WU9rfVLUhAvQFxI5eahelwinPQqhEf5kcioxsAd7/eq/8To",
  render_errors: [view: NisseWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Nisse.PubSub,
  live_view: [signing_salt: "vcJzG7c3"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
