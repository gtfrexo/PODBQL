defmodule PodbqlWeb.VenueView do
  use PodbqlWeb, :view
  alias PodbqlWeb.VenueView

  def render("index.json", %{venues: venues}) do
    %{data: render_many(venues, VenueView, "venue.json")}
  end

  def render("show.json", %{venue: venue}) do
    %{data: render_one(venue, VenueView, "venue.json")}
  end

  def render("venue.json", %{venue: venue}) do
    %{id: venue.id,
      venueId: venue.venueId,
      name: venue.name,
      nameFull: venue.nameFull,
      description: venue.description,
      eventsCreated: venue.eventsCreated,
      category: venue.category}
  end
end
