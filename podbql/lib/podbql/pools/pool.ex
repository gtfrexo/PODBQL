defmodule Podbql.Pools.Pool do
  use Ecto.Schema
  import Ecto.Changeset


  schema "pools" do
    field :influencedChats, :integer
    field :linkedEvent, :string
    field :poolId, Ecto.UUID

    timestamps()
  end

  @doc false
  def changeset(pool, attrs) do
    pool
    |> cast(attrs, [:poolId, :linkedEvent, :influencedChats])
    |> validate_required([:poolId, :linkedEvent, :influencedChats])
  end
end
