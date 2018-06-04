defmodule Podbql.PoolsTest do
  use Podbql.DataCase

  alias Podbql.Pools

  describe "pools" do
    alias Podbql.Pools.Pool

    @valid_attrs %{influencedChats: 42, linkedEvent: "some linkedEvent", poolId: "7488a646-e31f-11e4-aace-600308960662"}
    @update_attrs %{influencedChats: 43, linkedEvent: "some updated linkedEvent", poolId: "7488a646-e31f-11e4-aace-600308960668"}
    @invalid_attrs %{influencedChats: nil, linkedEvent: nil, poolId: nil}

    def pool_fixture(attrs \\ %{}) do
      {:ok, pool} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Pools.create_pool()

      pool
    end

    test "list_pools/0 returns all pools" do
      pool = pool_fixture()
      assert Pools.list_pools() == [pool]
    end

    test "get_pool!/1 returns the pool with given id" do
      pool = pool_fixture()
      assert Pools.get_pool!(pool.id) == pool
    end

    test "create_pool/1 with valid data creates a pool" do
      assert {:ok, %Pool{} = pool} = Pools.create_pool(@valid_attrs)
      assert pool.influencedChats == 42
      assert pool.linkedEvent == "some linkedEvent"
      assert pool.poolId == "7488a646-e31f-11e4-aace-600308960662"
    end

    test "create_pool/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Pools.create_pool(@invalid_attrs)
    end

    test "update_pool/2 with valid data updates the pool" do
      pool = pool_fixture()
      assert {:ok, pool} = Pools.update_pool(pool, @update_attrs)
      assert %Pool{} = pool
      assert pool.influencedChats == 43
      assert pool.linkedEvent == "some updated linkedEvent"
      assert pool.poolId == "7488a646-e31f-11e4-aace-600308960668"
    end

    test "update_pool/2 with invalid data returns error changeset" do
      pool = pool_fixture()
      assert {:error, %Ecto.Changeset{}} = Pools.update_pool(pool, @invalid_attrs)
      assert pool == Pools.get_pool!(pool.id)
    end

    test "delete_pool/1 deletes the pool" do
      pool = pool_fixture()
      assert {:ok, %Pool{}} = Pools.delete_pool(pool)
      assert_raise Ecto.NoResultsError, fn -> Pools.get_pool!(pool.id) end
    end

    test "change_pool/1 returns a pool changeset" do
      pool = pool_fixture()
      assert %Ecto.Changeset{} = Pools.change_pool(pool)
    end
  end
end
