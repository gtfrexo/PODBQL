defmodule Podbql.Messages.Message do
  use Ecto.Schema
  import Ecto.Changeset


  schema "messages" do
    field :content, :string
    #field :messageId, Ecto.UUID
    field :readAt, :utc_datetime
    field :wasRead, :boolean
    field :sender, :id
    field :sentTo, :id

    timestamps()
  end

  @doc false
  def changeset(message, attrs) do
    message
    |> cast(attrs, [:messageId, :content, :wasRead, :readAt])
    |> validate_required([:messageId, :content, :wasRead, :readAt])
  end
end
