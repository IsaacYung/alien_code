defmodule AlienCode.Post do
  use Ecto.Schema

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
end
