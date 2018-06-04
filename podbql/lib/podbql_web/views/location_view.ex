defmodule PodbqlWeb.LocationView do
  use PodbqlWeb, :view
  alias PodbqlWeb.LocationView

  def render("index.json", %{locations: locations}) do
    %{data: render_many(locations, LocationView, "location.json")}
  end

  def render("show.json", %{location: location}) do
    %{data: render_one(location, LocationView, "location.json")}
  end

  def render("location.json", %{location: location}) do
    %{id: location.id,
      country: location.country,
      state: location.state,
      city: location.city,
      zip: location.zip,
      address: location.address,
      addressFull: location.addressFull,
      lat: location.lat,
      lon: location.lon}
  end
end
