defmodule Podbql.EventsTest do
  use Podbql.DataCase

  alias Podbql.Events

  describe "events" do
    alias Podbql.Events.Event

    @valid_attrs %{category: "some category", description: "some description", endTime: ~N[2010-04-17 14:00:00.000000], eventClicked: 42, eventId: "7488a646-e31f-11e4-aace-600308960662", poolClicked: 42, startTime: ~N[2010-04-17 14:00:00.000000], title: "some title", titleFull: "some titleFull"}
    @update_attrs %{category: "some updated category", description: "some updated description", endTime: ~N[2011-05-18 15:01:01.000000], eventClicked: 43, eventId: "7488a646-e31f-11e4-aace-600308960668", poolClicked: 43, startTime: ~N[2011-05-18 15:01:01.000000], title: "some updated title", titleFull: "some updated titleFull"}
    @invalid_attrs %{category: nil, description: nil, endTime: nil, eventClicked: nil, eventId: nil, poolClicked: nil, startTime: nil, title: nil, titleFull: nil}

    def event_fixture(attrs \\ %{}) do
      {:ok, event} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Events.create_event()

      event
    end

    test "list_events/0 returns all events" do
      event = event_fixture()
      assert Events.list_events() == [event]
    end

    test "get_event!/1 returns the event with given id" do
      event = event_fixture()
      assert Events.get_event!(event.id) == event
    end

    test "create_event/1 with valid data creates a event" do
      assert {:ok, %Event{} = event} = Events.create_event(@valid_attrs)
      assert event.category == "some category"
      assert event.description == "some description"
      assert event.endTime == ~N[2010-04-17 14:00:00.000000]
      assert event.eventClicked == 42
      assert event.eventId == "7488a646-e31f-11e4-aace-600308960662"
      assert event.poolClicked == 42
      assert event.startTime == ~N[2010-04-17 14:00:00.000000]
      assert event.title == "some title"
      assert event.titleFull == "some titleFull"
    end

    test "create_event/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Events.create_event(@invalid_attrs)
    end

    test "update_event/2 with valid data updates the event" do
      event = event_fixture()
      assert {:ok, event} = Events.update_event(event, @update_attrs)
      assert %Event{} = event
      assert event.category == "some updated category"
      assert event.description == "some updated description"
      assert event.endTime == ~N[2011-05-18 15:01:01.000000]
      assert event.eventClicked == 43
      assert event.eventId == "7488a646-e31f-11e4-aace-600308960668"
      assert event.poolClicked == 43
      assert event.startTime == ~N[2011-05-18 15:01:01.000000]
      assert event.title == "some updated title"
      assert event.titleFull == "some updated titleFull"
    end

    test "update_event/2 with invalid data returns error changeset" do
      event = event_fixture()
      assert {:error, %Ecto.Changeset{}} = Events.update_event(event, @invalid_attrs)
      assert event == Events.get_event!(event.id)
    end

    test "delete_event/1 deletes the event" do
      event = event_fixture()
      assert {:ok, %Event{}} = Events.delete_event(event)
      assert_raise Ecto.NoResultsError, fn -> Events.get_event!(event.id) end
    end

    test "change_event/1 returns a event changeset" do
      event = event_fixture()
      assert %Ecto.Changeset{} = Events.change_event(event)
    end
  end
end
