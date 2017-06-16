defmodule AlienCode do
  @moduledoc """
  Documentation for AlienCode.
  """

  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      supervisor(AlienCode.API.Router, []),
      supervisor(AlienCode.Repo, [])
    ]

    opts = [strategy: :one_for_one, name: AlienCode.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
