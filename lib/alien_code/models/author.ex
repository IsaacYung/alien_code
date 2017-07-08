defmodule AlienCode.Models.Author do
  use Ecto.Schema
  import Ecto.Changeset
  import Comeonin.Bcrypt, only: [hashpwsalt: 1]
  @moduledoc false

  schema "authors" do
    field :login,    :string, unique: true
    field :pass,     :string
    field :pass_unencrypted, :string, virtual: true
    field :nicename, :string
    field :email,    :string
    field :status,   :string, default: "CREATED"
    field :display_name, :string

    has_many :posts, AlienCode.Models.Post

    timestamps()
  end

  @fields ~w(login email pass_unencrypted display_name nicename status)
  @requered_fields ~w(login email pass_unencrypted display_name nicename status)a

  @doc """
  Changeset for Authors Model

  Validate the length, primary key unique and encrypts the password

  ### Exemples

       iex> alias AlienCode.Models.Author
       AlienCode.Models.Author

       iex> Author.changeset(%Author{}, %{login: "isaaclog", email: "isaaczoi@gmail.com", pass_unencrypted: "12345678A", display_name: "Isaac Y", nicename: "isaac-yung"})
       #Ecto.Changeset<action: nil,
        changes: %{display_name: "Isaac Y", email: "isaaczoi@gmail.com",
          login: "isaaclog", nicename: "isaac-yung",
          pass: "$2b$12$ZhEuGsMjW7CQgSKL8qHqP.GmpTqAyFWBvxeifAKSnpZQTgNxVM5G.",
          pass_unencrypted: "12345678A"}, errors: [], data: #AlienCode.Author<>,
        valid?: true>
  """
  def changeset(login, params \\ :empty) do
    login
    |> cast(params, @fields)
    |> validate_required(@requered_fields)
    |> validate_length(:pass_unencrypted, min: 8)
    |> unique_constraint(:login, name: :email)
    |> put_change(:pass, hashpwsalt(params[:pass_unencrypted]))
  end
end
