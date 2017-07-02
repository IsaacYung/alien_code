defmodule AlienCode.Category do
  use Ecto.Schema

  schema "categories" do
    field :name,        :string
    field :nicename,    :string
    field :description, :string

    has_many :posts, AlienCode.Post

    timestamps()
  end
end
