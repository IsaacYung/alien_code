defmodule AlienCode.API.Router do
  @moduledoc """
  Router for API controllers
  """

  alias AlienCode.API.Connection
  alias AlienCode.API.Router

  use Plug.Router

  import Logger
  import Connection

  plug Plug.Logger
  plug :match
  plug :dispatch
  plug :hello

  get "/" do
    info "----"

    conn
  end

  def start_link do
    Plug.Adapters.Cowboy.http(Router, [])
  end
end
