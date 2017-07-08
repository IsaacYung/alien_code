defmodule AlienCode.Repo.Migrations.CreatePost do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :author_id, references(:authors)
      add :category_id, references(:categories)
      add :parent,  :integer
      add :title,   :text
      add :content, :text
      add :excerpt, :text
      add :status,  :string, size: 20
      add :name,    :string
      add :type,    :string, size: 20

      timestamps()
    end
  end
end
