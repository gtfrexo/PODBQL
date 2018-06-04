defmodule Podbql.Repo.Migrations.CreateVenues do
  use Ecto.Migration

  def change do
    create table(:venues) do
      add :venueId, :uuid
      add :name, :string
      add :nameFull, :string
      add :description, :string
      add :eventsCreated, :integer
      add :category, :string
      add :location_id, references(:locations, on_delete: :nothing)

      timestamps()
    end

    create index(:venues, [:location])
  end
end
