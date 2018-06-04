defmodule Podbql.Venues.Venue do
  use Ecto.Schema
  import Ecto.Changeset


  schema "venues" do
    field :category, :string
    field :description, :string
    field :eventsCreated, :integer
    field :name, :string
    field :nameFull, :string
    field :venueId, Ecto.UUID
    field :location, :id

    many_to_many(:events, Podbql.Events.Event, join_through: "events_venues")
    many_to_many(:hosts, Podbql.Hosts.Host, join_through: "hosts_venues")
    many_to_many(:images, Podbql.Medias.Media, join_through: "images_venues")

    timestamps()
  end

  @doc false
  def changeset(venue, attrs) do
    venue
    |> cast(attrs, [:venueId, :name, :nameFull, :description, :eventsCreated, :category])
    |> validate_required([:venueId, :name, :nameFull, :description, :eventsCreated, :category])
  end
end
