defmodule Podbql.LocationResolver do

    alias Podbql.Locations

    def all(_args, _info) do
        {:ok, Locations.list_locations()}
    end

    def find(%{id: id}, _info) do
        case Locations.get_location!(id) do
            nil -> {:error, "Location with id: #{id} not found."}
            location -> {:ok, location}
        end
    end

end