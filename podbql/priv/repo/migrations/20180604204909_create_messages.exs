defmodule Podbql.Repo.Migrations.CreateMessages do
  use Ecto.Migration

  def change do
    create table(:messages) do
      add :messageId, :uuid
      add :content, :string
      add :wasRead, :boolean, default: false, null: false
      add :readAt, :utc_datetime
      add :sender_id, references(:persons, on_delete: :nothing)
      add :sentTo_id, references(:persons, on_delete: :nothing)

      timestamps()
    end

    create index(:messages, [:sender])
    create index(:messages, [:sentTo])
  end
end
