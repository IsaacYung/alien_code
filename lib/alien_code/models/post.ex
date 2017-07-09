defmodule AlienCode.Models.Post do
  use Ecto.Schema
  import Ecto.Changeset
  @moduledoc """
  Post Model
  """

  schema "posts" do
    field :parent,  :integer
    field :title,   :string
    field :content, :string
    field :excerpt, :string
    field :status,  :string, default: "EXECERPT"
    field :name,    :string
    field :type,    :string

    belongs_to :author, AlienCode.Models.Author
    belongs_to :category, AlienCode.Models.Category

    many_to_many :tags, AlienCode.Models.Tag, join_through: "tags_has_posts"

    timestamps()
  end

  @fields ~w(title content status name type parent excerpt)
  @requered_fields ~w(title content status name type)a

  @doc """
  Changeset for Post Model

  Validate the length of the name and content

  ### Exemples

      iex> alias AlienCode.Models.Post
      AlienCode.Models.Post

      iex> Post.changeset(%Post{}, %{title: "Elixir, vale a pena?", content: "Elixir vale a pena usar ...", name: "elixir-vale-a-pena", excerpt: "Elixir vale a ...", type: "POST"})
      #Ecto.Changeset<action: nil,
       changes: %{content: "Elixir vale a pena usar ...",
         excerpt: "Elixir vale a ...", name: "elixir-vale-a-pena",
         title: "Elixir, vale a pena?", type: "POST"}, errors: [],
       data: #AlienCode.Post<>, valid?: true>
  """
  def changeset(post, params \\ :empty) do
    post
    |> cast(params, @fields)
    |> validate_required(@requered_fields)
    |> validate_length(:name, min: 3)
    |> validate_length(:content, min: 10)
  end
end
