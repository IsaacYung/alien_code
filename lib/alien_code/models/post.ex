defmodule AlienCode.Post do
  use Ecto.Schema

  schema "posts" do
    field :parent,  :integer
    field :title,   :text
    field :content, :longtext
    field :excerpt, :text
    field :status,  :string, default: "EXECERPT"
    field :name,    :string
    field :type,    :string

    belongs_to :author, AlienCode.Author
    belongs_to :category, AlienCode.Category

    many_to_many :tags, AlienCode.Tag, join_through: "tags_has_posts"

    timestamps()
  end
end
