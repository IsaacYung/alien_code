# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
use Mix.Config

config :alien_code, AlienCode.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "alien_code_repo",
  username: "postgres",
  password: "root",
  hostname: "localhost"

config :alien_code, ecto_repos: [AlienCode.Repo]
