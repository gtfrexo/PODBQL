defmodule Podbql.Locations.Location do
  use Ecto.Schema
  import Ecto.Changeset


  schema "locations" do
    field :address, :string
    field :addressFull, :string
    field :city, :string
    field :country, :string
    field :lat, :float
    field :lon, :float
    field :state, :string
    field :zip, :string

    timestamps()
  end

  @doc false
  def changeset(location, attrs) do
    location
    |> cast(attrs, [:country, :state, :city, :zip, :address, :addressFull, :lat, :lon])
    |> validate_required([:country, :state, :city, :zip, :address, :addressFull, :lat, :lon])
  end
end
