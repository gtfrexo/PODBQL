defmodule PodbqlWeb.PersonControllerTest do
  use PodbqlWeb.ConnCase

  alias Podbql.Persons
  alias Podbql.Persons.Person

  @create_attrs %{age: 42, birthday: "2010-04-17 14:00:00.000000Z", currentlyBlocking: [], email: "some email", eventsCreated: 42, gender: "some gender", messagesRecieved: 42, messagesSent: 42, name: "some name", nameFull: "some nameFull", password: "some password", poolsJoined: 42, startedChats: 42, targetGender: "some targetGender", targetRelationship: "some targetRelationship", uid: "7488a646-e31f-11e4-aace-600308960662", worstPickup: "some worstPickup"}
  @update_attrs %{age: 43, birthday: "2011-05-18 15:01:01.000000Z", currentlyBlocking: [], email: "some updated email", eventsCreated: 43, gender: "some updated gender", messagesRecieved: 43, messagesSent: 43, name: "some updated name", nameFull: "some updated nameFull", password: "some updated password", poolsJoined: 43, startedChats: 43, targetGender: "some updated targetGender", targetRelationship: "some updated targetRelationship", uid: "7488a646-e31f-11e4-aace-600308960668", worstPickup: "some updated worstPickup"}
  @invalid_attrs %{age: nil, birthday: nil, currentlyBlocking: nil, email: nil, eventsCreated: nil, gender: nil, messagesRecieved: nil, messagesSent: nil, name: nil, nameFull: nil, password: nil, poolsJoined: nil, startedChats: nil, targetGender: nil, targetRelationship: nil, uid: nil, worstPickup: nil}

  def fixture(:person) do
    {:ok, person} = Persons.create_person(@create_attrs)
    person
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all persons", %{conn: conn} do
      conn = get conn, person_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create person" do
    test "renders person when data is valid", %{conn: conn} do
      conn = post conn, person_path(conn, :create), person: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, person_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "age" => 42,
        "birthday" => "2010-04-17 14:00:00.000000Z",
        "currentlyBlocking" => [],
        "email" => "some email",
        "eventsCreated" => 42,
        "gender" => "some gender",
        "messagesRecieved" => 42,
        "messagesSent" => 42,
        "name" => "some name",
        "nameFull" => "some nameFull",
        "password" => "some password",
        "poolsJoined" => 42,
        "startedChats" => 42,
        "targetGender" => "some targetGender",
        "targetRelationship" => "some targetRelationship",
        "uid" => "7488a646-e31f-11e4-aace-600308960662",
        "worstPickup" => "some worstPickup"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, person_path(conn, :create), person: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update person" do
    setup [:create_person]

    test "renders person when data is valid", %{conn: conn, person: %Person{id: id} = person} do
      conn = put conn, person_path(conn, :update, person), person: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, person_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "age" => 43,
        "birthday" => "2011-05-18 15:01:01.000000Z",
        "currentlyBlocking" => [],
        "email" => "some updated email",
        "eventsCreated" => 43,
        "gender" => "some updated gender",
        "messagesRecieved" => 43,
        "messagesSent" => 43,
        "name" => "some updated name",
        "nameFull" => "some updated nameFull",
        "password" => "some updated password",
        "poolsJoined" => 43,
        "startedChats" => 43,
        "targetGender" => "some updated targetGender",
        "targetRelationship" => "some updated targetRelationship",
        "uid" => "7488a646-e31f-11e4-aace-600308960668",
        "worstPickup" => "some updated worstPickup"}
    end

    test "renders errors when data is invalid", %{conn: conn, person: person} do
      conn = put conn, person_path(conn, :update, person), person: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete person" do
    setup [:create_person]

    test "deletes chosen person", %{conn: conn, person: person} do
      conn = delete conn, person_path(conn, :delete, person)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, person_path(conn, :show, person)
      end
    end
  end

  defp create_person(_) do
    person = fixture(:person)
    {:ok, person: person}
  end
end
