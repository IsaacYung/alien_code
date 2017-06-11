defmodule AlienCode.Router do
  use Plug.Router

  import Logger
  import AlienCode.Connection


  plug Plug.Logger
  plug :match
  plug :dispatch
  plug :hello

  def start_link do
    Plug.Adapters.Cowboy.http(AlienCode.Router, [])
  end

  get "/" do
    info "----"

    conn
  end
end
