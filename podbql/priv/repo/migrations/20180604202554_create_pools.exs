defmodule Podbql.Repo.Migrations.CreatePools do
  use Ecto.Migration

  def change do
    create table(:pools) do
      add :poolId, :uuid
      add :linkedEvent, :string
      add :influencedChats, :integer

      timestamps()
    end

  end
end
