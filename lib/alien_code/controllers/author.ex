defmodule AlienCode.Controllers.Author do
  alias AlienCode.Presenters.Response
  alias AlienCode.Models.Author
  alias AlienCode.Repo
  import Ecto.Query

  def new(conn) do
    params = conn.body_params["author"]
    changeset = Author.changeset(%Author{},
    %{
      login: params["login"],
      email: params["email"],
      pass_unencrypted: params["password"],
      display_name: params["display_name"],
      nicename: params["nicename"]
    })

    cond do
      changeset.valid? == true ->
        Repo.insert changeset
        Response.build 200, conn.body_params
      changeset.valid? == false ->
        Response.build 400, conn.body_params
    end
  end
end
