defmodule AlienCode.API.Connection do
  @moduledoc """
  Plug collection for handle requests
  """


  use Plug.Builder
  import Plug.Conn

  def atomize(conn, options) do
    IO.inspect conn.body_params
    conn
  end
end
