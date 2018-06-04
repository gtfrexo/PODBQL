defmodule Podbql.Repo.Migrations.CreateHosts do
  use Ecto.Migration

  def change do
    create table(:hosts) do
      add :hostId, :uuid
      add :name, :string
      add :nameFull, :string
      add :description, :string
      add :createdEvents, :integer

      timestamps()
    end

  end
end
