defmodule Podbql.Chats.Chat do
  use Ecto.Schema
  import Ecto.Changeset


  schema "chats" do
    #field :chatId, Ecto.UUID
    field :isBlocked, :boolean
    field :initiator, :id
    field :fromPool, :id
    has_many :messages, Podbql.Messages.Message
    has_many :persons, Podbql.Persons.Person

    timestamps()
  end

  @doc false
  def changeset(chat, attrs) do
    chat
    |> cast(attrs, [:chatId, :isBlocked])
    |> validate_required([:chatId, :isBlocked])
  end
end
