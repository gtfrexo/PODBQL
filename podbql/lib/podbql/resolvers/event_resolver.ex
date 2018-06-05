defmodule Podbql.EventResolver do

    alias Podbql.Events

    def all(_args, _info) do
        {:ok, Events.list_events()}
    end

    def find(%{id: id}, _info) do
        case Events.get_event!(id) do
            nil -> {:error, "Event with id: #{id} not found."}
            event -> {:ok, event}
        end
    end

end