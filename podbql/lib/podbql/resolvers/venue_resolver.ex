defmodule Podbql.VenueResolver do

    alias Podbql.Venues

    def all(_args, _info) do
        {:ok, Venues.list_venues()}
    end

    def find(%{id: id}, _info) do
        case Venues.get_venue!(id) do
            nil -> {:error, "Venue with id: #{id} not found."}
            venue -> {:ok, venue}
        end
    end

end