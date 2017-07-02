defmodule AlienCode.Repo.Migrations.CreateAuthors do
  use Ecto.Migration

  def change do
    create table(:authors) do
      add :login,    :string, unique: true
      add :pass,     :string
      add :nicename, :string
      add :email,    :string
      add :status,   :string, size: 20
      add :display_name, :string

      timestamps()
    end

    create unique_index(:authors, [:login], name: :unique_logins)
  end
end
