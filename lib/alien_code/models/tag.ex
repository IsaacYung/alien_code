defmodule AlienCode.Tag do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tags" do
    field :name,     :string
    field :nicename, :string

    many_to_many :posts, AlienCode.Post, join_through: "tags_has_posts"

    timestamps()
  end

  @required_fields ~w(name nicename)
  @optional_fields ~w()

  def changeset(post, params \\ :empty) do
    post
    |> cast(params, @required_fields, @optional_fields)
    |> validate_length(:name, min: 3)
  end
end
