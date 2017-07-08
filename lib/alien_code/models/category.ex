defmodule AlienCode.Category do
  use Ecto.Schema
  import Ecto.Changeset

  schema "categories" do
    field :name,        :string
    field :nicename,    :string
    field :description, :string

    has_many :posts, AlienCode.Post

    timestamps()
  end

  @required_fields ~w(name nicename)
  @optional_fields ~w(description)

  def changeset(category, params \\ :empty) do
    category
    |> cast(params, @required_fields, @optional_fields)
    |> validate_length(:nicename, min: 3)
    |> validate_length(:name, min: 3)
  end
end
