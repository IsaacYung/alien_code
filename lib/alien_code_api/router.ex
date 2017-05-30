defmodule AlienCodeApi.Router do
  use Plug.Router
  import Logger

  plug :match
  plug :dispatch

  def start_link do
    Plug.Adapters.Cowboy.http(AlienCodeApi.Router,[])
  end

  get "/" do
    info "foi"

    conn
    |> send_resp(201, "Plug!")
  end
end
