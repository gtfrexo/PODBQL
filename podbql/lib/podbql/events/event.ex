defmodule Podbql.Events.Event do
  use Ecto.Schema
  import Ecto.Changeset


  schema "events" do
    field :category, :string
    field :description, :string
    field :endTime, :naive_datetime
    field :eventClicked, :integer
    field :eventId, Ecto.UUID
    field :poolClicked, :integer
    field :startTime, :naive_datetime
    field :title, :string
    field :titleFull, :string
    field :locationCreated, :id
    field :whoCreated, :id
    field :mainPic, :id

    many_to_many :hosts, Podbql.Hosts.Host, join_through, "hosts_events"
    many_to_many :images, Podbql.Medias.Media, join_through, "medias_events"
    many_to_many :venues, Podbql.Venues.Venue, join_through, "venues_events"

    timestamps()
  end

  @doc false
  def changeset(event, attrs) do
    event
    |> cast(attrs, [:eventId, :title, :titleFull, :category, :startTime, :endTime, :description, :eventClicked, :poolClicked])
    |> validate_required([:eventId, :title, :titleFull, :category, :startTime, :endTime, :description, :eventClicked, :poolClicked])
  end
end
