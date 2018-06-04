defmodule Podbql.Repo.Migrations.CreateLocations do
  use Ecto.Migration

  def change do
    create table(:locations) do
      add :country, :string
      add :state, :string
      add :city, :string
      add :zip, :string
      add :address, :string
      add :addressFull, :string
      add :lat, :float
      add :lon, :float

      timestamps()
    end

  end
end
