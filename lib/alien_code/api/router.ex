defmodule AlienCode.API.Router do
  @moduledoc """
  Router for API controllers
  """
  alias AlienCode.API.Connection
  alias AlienCode.API.Router
  alias AlienCode.Controllers

  if Mix.env == :dev do
    use Plug.Debugger
  end
  use Plug.ErrorHandler
  use Plug.Router

  import Logger
  import Connection

  plug Plug.Logger
  plug :match
  plug Plug.Parsers, parsers: [:json],
                     pass:  ["application/json"],
                     json_decoder: Poison
  plug :dispatch

  # Routes
  post "/authors" do
    response = Controllers.Author.new conn
    send_resp(conn, response.status, response.body)
  end

  defp handle_errors(conn, %{kind: _kind, reason: _reason, stack: _stack}) do
    send_resp(conn, conn.status, "Something went wrong")
  end

  def start_link do
    Plug.Adapters.Cowboy.http(Router, [])
  end
end
