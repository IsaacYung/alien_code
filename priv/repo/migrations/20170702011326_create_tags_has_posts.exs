defmodule AlienCode.Repo.Migrations.CreateTagsHasPosts do
  use Ecto.Migration

  def change do
    create table(:tags_has_posts) do
      add :tags_id,  references(:tags)
      add :posts_id, references(:posts)
      add :posts_authors_id, references(:authors)

      timestamps()
    end
  end
end
