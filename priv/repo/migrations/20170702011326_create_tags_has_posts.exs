defmodule AlienCode.Repo.Migrations.CreateTagsHasPosts do
  use Ecto.Migration

  def change do
    create table(:tags_has_posts) do
      add :tag_id,  references(:tags)
      add :post_id, references(:posts)
      add :post_author_id, references(:authors)

      timestamps()
    end
  end
end
