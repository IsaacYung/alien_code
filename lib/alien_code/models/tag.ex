defmodule AlienCode.Models.Tag do
  use Ecto.Schema
  import Ecto.Changeset
  @moduledoc """
  Tag Model
  """

  schema "tags" do
    field :name,     :string
    field :nicename, :string

    many_to_many :posts, AlienCode.Models.Post, join_through: "tags_has_posts"

    timestamps()
  end

  @fields ~w(name nicename)
  @requered_fields ~w(nicename name)a

  @doc """
  Changeset for Tag Model

  Validate the length of the name and content

  ### Exemples

      iex> alias AlienCode.Models.Tag
      AlienCode.Models.Tag

      iex> Tag.changeset(%Tag{}, %{name: "programacao", nicename: "Programaçâo"})
      #Ecto.Changeset<action: nil,
       changes: %{name: "programacao", nicename: "Programaçâo"}, errors: [],
      data: #AlienCode.Tag<>, valid?: true>

  """
  def changeset(post, params \\ :empty) do
    post
    |> cast(params, @fields)
    |> validate_required(@requered_fields)
    |> validate_length(:name, min: 3)
  end
end
