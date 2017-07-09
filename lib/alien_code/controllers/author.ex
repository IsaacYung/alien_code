defmodule AlienCode.Controllers.Author do
  alias AlienCode.Presenters.Response

  def new(conn) do
    IO.inspect conn.body_params
    Response.build 200, conn.body_params
  end
end
