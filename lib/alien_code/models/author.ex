defmodule AlienCode.Author do
  use Ecto.Schema

  schema "authors" do
    field :login,    :string, unique: true
    field :pass,     :string
    field :nicename, :string
    field :email,    :string
    field :status,   :string, default: "CREATED"
    field :display_name, :string

    has_many :posts, AlienCode.Post

    timestamps()
  end
end
