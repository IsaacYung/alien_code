defmodule AlienCode.API.Connection do
  use Plug.Builder
  import Plug.Conn

  def hello(conn, options) do
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(201, "{\"Hello\": \"World GO\"}")
  end
end
