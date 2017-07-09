defmodule AlienCode.Models.Category do
  use Ecto.Schema
  import Ecto.Changeset
  @moduledoc """
  Category Model
  """

  schema "categories" do
    field :name,        :string
    field :nicename,    :string
    field :description, :string

    has_many :posts, AlienCode.Models.Post

    timestamps()
  end

  @fields ~w(name nicename description)
  @requered_fields ~w(name nicename)a

  @doc """
  Changeset for Category Model

  Validate the length of the name and nicename

  ### Exemples

      iex> alias AlienCode.Models.Category
      AlienCode.Models.Category

      iex> Category.changeset(%Category{}, %{name: "linguagens", nicename: "Linguagens", description: "Linguagens de programação modernas"})
      #Ecto.Changeset<action: nil,
       changes: %{description: "Linguagens de programação modernas",
       name: "linguagens", nicename: "Linguagens"}, errors: [],
      data: #AlienCode.Category<>, valid?: true>

  """
  def changeset(category, params \\ :empty) do
    category
    |> cast(params, @fields)
    |> validate_required(@requered_fields)
    |> validate_length(:nicename, min: 3)
    |> validate_length(:name, min: 3)
  end
end
