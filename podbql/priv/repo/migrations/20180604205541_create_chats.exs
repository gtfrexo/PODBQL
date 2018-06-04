defmodule Podbql.Repo.Migrations.CreateChats do
  use Ecto.Migration

  def change do
    create table(:chats) do
      add :chatId, :uuid
      add :isBlocked, :boolean, default: false, null: false
      add :initiator_id, references(:persons, on_delete: :nothing)
      add :fromPool_id, references(:pools, on_delete: :nothing)

      timestamps()
    end

    create index(:chats, [:initiator])
    create index(:chats, [:fromPool])
  end
end
