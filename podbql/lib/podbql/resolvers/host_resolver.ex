defmodule Podbql.HostResolver do

    alias Podbql.Hosts

    def all(_args, _info) do
        {:ok, Hosts.list_hosts()}
    end

    def find(%{id: id}, _info) do
        case Hosts.get_host!(id) do
            nil -> {:error, "Host with id: #{id} not found."}
            host -> {:ok, host}
        end
    end

end