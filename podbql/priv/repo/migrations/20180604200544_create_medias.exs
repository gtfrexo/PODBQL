defmodule Podbql.Repo.Migrations.CreateMedias do
  use Ecto.Migration

  def change do
    create table(:medias) do
      add :mediaId, :uuid
      add :mediaType, :string
      add :url, :string
      add :description, :string
      add :deletedAt, :utc_datetime

      timestamps()
    end

  end
end
