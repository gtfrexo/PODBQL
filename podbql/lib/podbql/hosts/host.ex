defmodule Podbql.Hosts.Host do
  use Ecto.Schema
  import Ecto.Changeset


  schema "hosts" do
    field :createdEvents, :integer
    field :description, :string
    field :hostId, Ecto.UUID
    field :name, :string
    field :nameFull, :string

    timestamps()
  end

  @doc false
  def changeset(host, attrs) do
    host
    |> cast(attrs, [:hostId, :name, :nameFull, :description, :createdEvents])
    |> validate_required([:hostId, :name, :nameFull, :description, :createdEvents])
  end
end
