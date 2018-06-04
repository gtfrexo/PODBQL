defmodule PodbqlWeb.EventView do
  use PodbqlWeb, :view
  alias PodbqlWeb.EventView

  def render("index.json", %{events: events}) do
    %{data: render_many(events, EventView, "event.json")}
  end

  def render("show.json", %{event: event}) do
    %{data: render_one(event, EventView, "event.json")}
  end

  def render("event.json", %{event: event}) do
    %{id: event.id,
      eventId: event.eventId,
      title: event.title,
      titleFull: event.titleFull,
      category: event.category,
      startTime: event.startTime,
      endTime: event.endTime,
      description: event.description,
      eventClicked: event.eventClicked,
      poolClicked: event.poolClicked}
  end
end
