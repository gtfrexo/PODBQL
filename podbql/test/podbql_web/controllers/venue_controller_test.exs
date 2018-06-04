defmodule PodbqlWeb.VenueControllerTest do
  use PodbqlWeb.ConnCase

  alias Podbql.Venues
  alias Podbql.Venues.Venue

  @create_attrs %{category: "some category", description: "some description", eventsCreated: 42, name: "some name", nameFull: "some nameFull", venueId: "7488a646-e31f-11e4-aace-600308960662"}
  @update_attrs %{category: "some updated category", description: "some updated description", eventsCreated: 43, name: "some updated name", nameFull: "some updated nameFull", venueId: "7488a646-e31f-11e4-aace-600308960668"}
  @invalid_attrs %{category: nil, description: nil, eventsCreated: nil, name: nil, nameFull: nil, venueId: nil}

  def fixture(:venue) do
    {:ok, venue} = Venues.create_venue(@create_attrs)
    venue
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all venues", %{conn: conn} do
      conn = get conn, venue_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create venue" do
    test "renders venue when data is valid", %{conn: conn} do
      conn = post conn, venue_path(conn, :create), venue: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, venue_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "category" => "some category",
        "description" => "some description",
        "eventsCreated" => 42,
        "name" => "some name",
        "nameFull" => "some nameFull",
        "venueId" => "7488a646-e31f-11e4-aace-600308960662"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, venue_path(conn, :create), venue: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update venue" do
    setup [:create_venue]

    test "renders venue when data is valid", %{conn: conn, venue: %Venue{id: id} = venue} do
      conn = put conn, venue_path(conn, :update, venue), venue: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, venue_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "category" => "some updated category",
        "description" => "some updated description",
        "eventsCreated" => 43,
        "name" => "some updated name",
        "nameFull" => "some updated nameFull",
        "venueId" => "7488a646-e31f-11e4-aace-600308960668"}
    end

    test "renders errors when data is invalid", %{conn: conn, venue: venue} do
      conn = put conn, venue_path(conn, :update, venue), venue: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete venue" do
    setup [:create_venue]

    test "deletes chosen venue", %{conn: conn, venue: venue} do
      conn = delete conn, venue_path(conn, :delete, venue)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, venue_path(conn, :show, venue)
      end
    end
  end

  defp create_venue(_) do
    venue = fixture(:venue)
    {:ok, venue: venue}
  end
end
