defmodule AlienCode.API.Router do
  use Plug.Router

  import Logger
  import AlienCode.API.Connection


  plug Plug.Logger
  plug :match
  plug :dispatch
  plug :hello

  def start_link do
    Plug.Adapters.Cowboy.http(AlienCode.API.Router, [])
  end

  get "/" do
    info "----"

    conn
  end
end
