defmodule AlienCode.Tag do
  use Ecto.Schema

  schema "tags" do
    field :name,     :string
    field :nicename, :string

    many_to_many :posts, AlienCode.Post, join_through: "tags_has_posts"

    timestamps()
  end
end
