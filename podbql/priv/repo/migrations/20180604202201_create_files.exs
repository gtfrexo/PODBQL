defmodule Podbql.Repo.Migrations.CreateFiles do
  use Ecto.Migration

  def change do
    create table(:files) do
      add :fileId, :uuid
      add :name, :string
      add :nameFull, :string
      add :secret, :string
      add :size, :integer
      add :url, :string
      add :contentType, :string

      timestamps()
    end

  end
end
