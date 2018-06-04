defmodule PodbqlWeb.PoolView do
  use PodbqlWeb, :view
  alias PodbqlWeb.PoolView

  def render("index.json", %{pools: pools}) do
    %{data: render_many(pools, PoolView, "pool.json")}
  end

  def render("show.json", %{pool: pool}) do
    %{data: render_one(pool, PoolView, "pool.json")}
  end

  def render("pool.json", %{pool: pool}) do
    %{id: pool.id,
      poolId: pool.poolId,
      linkedEvent: pool.linkedEvent,
      influencedChats: pool.influencedChats}
  end
end
