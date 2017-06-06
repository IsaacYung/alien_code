defmodule AlienCodeApi.Router do
  use Plug.Router
  import Logger

  alias AlienCodeApi.Connection

  plug :match
  plug :dispatch
  plug Connection

  def start_link do
    Plug.Adapters.Cowboy.http(AlienCodeApi.Router,[])
  end

  get "/" do
    info "----"

    conn
  end
end
