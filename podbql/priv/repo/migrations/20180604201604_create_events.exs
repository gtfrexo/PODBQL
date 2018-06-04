defmodule Podbql.Repo.Migrations.CreateEvents do
  use Ecto.Migration

  def change do
    create table(:events) do
      add :eventId, :uuid
      add :title, :string
      add :titleFull, :string
      add :category, :string
      add :startTime, :naive_datetime
      add :endTime, :naive_datetime
      add :description, :string
      add :eventClicked, :integer
      add :poolClicked, :integer
      add :locationCreated_id, references(:locations, on_delete: :nothing)
      add :whoCreated_id, references(:persons, on_delete: :nothing)
      add :mainPic_id, references(:medias, on_delete: :nothing)

      timestamps()
    end

    create index(:events, [:locationCreated])
    create index(:events, [:whoCreated])
    create index(:events, [:mainPic])
  end
end
