defmodule Podbql.Repo.Migrations.CreatePersons do
  use Ecto.Migration

  def change do
    create table(:persons) do
      add :uid, :uuid
      add :name, :string
      add :nameFull, :string
      add :gender, :string
      add :birthday, :utc_datetime
      add :age, :integer
      add :targetRelationship, :string
      add :targetGender, :string
      add :worstPickup, :string
      add :email, :string
      add :password, :string
      add :poolsJoined, :integer
      add :startedChats, :integer
      add :currentlyBlocking, {:array, :uuid}
      add :messagesSent, :integer
      add :messagesRecieved, :integer
      add :eventsCreated, :integer

      timestamps()
    end

  end
end
