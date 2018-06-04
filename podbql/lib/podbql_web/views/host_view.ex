defmodule PodbqlWeb.HostView do
  use PodbqlWeb, :view
  alias PodbqlWeb.HostView

  def render("index.json", %{hosts: hosts}) do
    %{data: render_many(hosts, HostView, "host.json")}
  end

  def render("show.json", %{host: host}) do
    %{data: render_one(host, HostView, "host.json")}
  end

  def render("host.json", %{host: host}) do
    %{id: host.id,
      hostId: host.hostId,
      name: host.name,
      nameFull: host.nameFull,
      description: host.description,
      createdEvents: host.createdEvents}
  end
end
