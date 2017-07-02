defmodule AlienCode.Author do
  use Ecto.Schema
  import Ecto.Changeset

  schema "authors" do
    field :login,    :string, unique: true
    field :pass,     :string
    field :pass_unencrypted, :string, virtual: true
    field :nicename, :string
    field :email,    :string
    field :status,   :string, default: "CREATED"
    field :display_name, :string
    
    has_many :posts, AlienCode.Post

    timestamps()
  end

  @required_fields ~w(login pass email)
  @optional_fields ~w()

  def changeset(login, params \\ :empty) do
    login
    |> cast(params, @required_fields, @optional_fields)
    |> unique_constraint(:login)
  end
end
