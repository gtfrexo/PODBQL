defmodule Podbql.PersonResolver do

    alias Podbql.Persons

    def all(_args, _info) do
        {:ok, Persons.list_persons()}
    end

    def find(%{id: id}, _info) do
        case Persons.get_person!(id) do
            nil -> {:error, "Person with id: #{id} not found."}
            person -> {:ok, person}
        end
    end

end