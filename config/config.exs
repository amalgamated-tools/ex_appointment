# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :ex_appointment,
  ecto_repos: [ExAppointment.Repo],
  generators: [binary_id: true]

# Configures the endpoint
config :ex_appointment, ExAppointmentWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "g7F7Hlk++uyJ6o7uD9lNFyYvD6AHrpJ+3QbgPlihP1/A02/CMDrEYVKCjMJgZwfv",
  render_errors: [view: ExAppointmentWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: ExAppointment.PubSub,
  live_view: [signing_salt: "ELcDZkRa"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :ueberauth, Ueberauth,
  providers: [
    google: {Ueberauth.Strategy.Google, []}
  ]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
