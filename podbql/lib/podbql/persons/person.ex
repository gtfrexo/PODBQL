defmodule Podbql.Persons.Person do
  use Ecto.Schema
  import Ecto.Changeset


  schema "persons" do
    field :age, :integer
    field :birthday, :utc_datetime
    field :currentlyBlocking, {:array, Ecto.UUID}
    field :email, :string
    field :eventsCreated, :integer
    field :gender, :string
    field :messagesRecieved, :integer
    field :messagesSent, :integer
    field :name, :string
    field :nameFull, :string
    field :password, :string
    field :poolsJoined, :integer
    field :startedChats, :integer
    field :targetGender, :string
    field :targetRelationship, :string
    field :uid, Ecto.UUID
    field :worstPickup, :string

    has_many :createdEvents, Podbql.Events.Event
    has_many :createdChats, Podbql.Chats.Chat
    has_many :joinedPools, Podbql.Pools.Pool

    timestamps()
  end

  @doc false
  def changeset(person, attrs) do
    person
    |> cast(attrs, [:uid, :name, :nameFull, :gender, :birthday, :age, :targetRelationship, :targetGender, :worstPickup, :email, :password, :poolsJoined, :startedChats, :currentlyBlocking, :messagesSent, :messagesRecieved, :eventsCreated])
    |> validate_required([:uid, :name, :nameFull, :gender, :birthday, :age, :targetRelationship, :targetGender, :worstPickup, :email, :password, :poolsJoined, :startedChats, :currentlyBlocking, :messagesSent, :messagesRecieved, :eventsCreated])
  end
end
