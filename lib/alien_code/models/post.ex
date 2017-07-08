defmodule AlienCode.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field :parent,  :integer
    field :title,   :string
    field :content, :string
    field :excerpt, :string
    field :status,  :string, default: "EXECERPT"
    field :name,    :string
    field :type,    :string

    belongs_to :authors, AlienCode.Author
    belongs_to :categories, AlienCode.Category

    many_to_many :tags, AlienCode.Tag, join_through: "tags_has_posts"

    timestamps()
  end

  @required_fields ~w(title content status name type)
  @optional_fields ~w(parent excerpt)

  def changeset(post, params \\ :empty) do
    post
    |> cast(params, @required_fields, @optional_fields)
    |> validate_length(:name, min: 3)
    |> validate_length(:content, min: 10)
  end
end
