defmodule Podbql.PoolResolver do

    alias Podbql.Pools

    def all(_args, _info) do
        {:ok, Pools.list_pools()}
    end

    def find(%{id: id}, _info) do
        case Pools.get_pool!(id) do
            nil -> {:error, "Pool with id: #{id} not found."}
            pool -> {:ok, pool}
        end
    end

end