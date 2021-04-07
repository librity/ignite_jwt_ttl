# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :repo,
  ecto_repos: [Repo.Repo]

# Configures the endpoint
config :repo, RepoWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "e+IG16BOSCXWrbwORyK0d0mn00FIlqnb9vOGhu/uG1Q/5ZCrcEOmZb1zZp2yv8x3",
  render_errors: [view: RepoWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Repo.PubSub,
  live_view: [signing_salt: "bGoaefsO"]

config :repo, RepoWeb.ReposController, github_adapter: Github.Client

# Custom
config :repo, RepoWeb.Auth.Guardian,
  issuer: "repo",
  secret_key: "8N/uPUUWbFku4F5dWG1gnx0TvjW/3K6KVqvMzYIJxg7INrzXg+GafK2biOl7nTin"

config :repo, RepoWeb.Auth.Pipeline,
  module: RepoWeb.Auth.Guardian,
  error_handler: RepoWeb.Auth.ErrorHandler

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
