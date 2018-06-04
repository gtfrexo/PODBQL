defmodule Podbql.Repo.Migrations.CreatePersons do
  use Ecto.Migration

  def change do
    create table(:persons) do
      add :bio, :string
      add :birthday, :utc_datetime
      add :name, :string
      add :nameFull, :string
      add :gender, :string
      add :lookingFor, :string
      add :withA, :string
      add :worstPickup, :string
      add :email, :string
      add :password, :string
      add :poolsJoined, :integer
      add :uid, :uuid
      add :startedChats, :integer
      add :messagesSent, :integer
      add :messagesRecieved, :integer
      add :age, :integer
      add :eventsCreated, :integer

      timestamps()
    end

  end
end
