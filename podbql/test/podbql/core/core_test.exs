defmodule Podbql.CoreTest do
  use Podbql.DataCase

  alias Podbql.Core

  describe "persons" do
    alias Podbql.Core.Person

    @valid_attrs %{age: 42, bio: "some bio", birthday: "2010-04-17 14:00:00.000000Z", email: "some email", eventsCreated: 42, gender: "some gender", lookingFor: "some lookingFor", messagesRecieved: 42, messagesSent: 42, name: "some name", nameFull: "some nameFull", password: "some password", poolsJoined: 42, startedChats: 42, uid: "7488a646-e31f-11e4-aace-600308960662", withA: "some withA", worstPickup: "some worstPickup"}
    @update_attrs %{age: 43, bio: "some updated bio", birthday: "2011-05-18 15:01:01.000000Z", email: "some updated email", eventsCreated: 43, gender: "some updated gender", lookingFor: "some updated lookingFor", messagesRecieved: 43, messagesSent: 43, name: "some updated name", nameFull: "some updated nameFull", password: "some updated password", poolsJoined: 43, startedChats: 43, uid: "7488a646-e31f-11e4-aace-600308960668", withA: "some updated withA", worstPickup: "some updated worstPickup"}
    @invalid_attrs %{age: nil, bio: nil, birthday: nil, email: nil, eventsCreated: nil, gender: nil, lookingFor: nil, messagesRecieved: nil, messagesSent: nil, name: nil, nameFull: nil, password: nil, poolsJoined: nil, startedChats: nil, uid: nil, withA: nil, worstPickup: nil}

    def person_fixture(attrs \\ %{}) do
      {:ok, person} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Core.create_person()

      person
    end

    test "list_persons/0 returns all persons" do
      person = person_fixture()
      assert Core.list_persons() == [person]
    end

    test "get_person!/1 returns the person with given id" do
      person = person_fixture()
      assert Core.get_person!(person.id) == person
    end

    test "create_person/1 with valid data creates a person" do
      assert {:ok, %Person{} = person} = Core.create_person(@valid_attrs)
      assert person.age == 42
      assert person.bio == "some bio"
      assert person.birthday == DateTime.from_naive!(~N[2010-04-17 14:00:00.000000Z], "Etc/UTC")
      assert person.email == "some email"
      assert person.eventsCreated == 42
      assert person.gender == "some gender"
      assert person.lookingFor == "some lookingFor"
      assert person.messagesRecieved == 42
      assert person.messagesSent == 42
      assert person.name == "some name"
      assert person.nameFull == "some nameFull"
      assert person.password == "some password"
      assert person.poolsJoined == 42
      assert person.startedChats == 42
      assert person.uid == "7488a646-e31f-11e4-aace-600308960662"
      assert person.withA == "some withA"
      assert person.worstPickup == "some worstPickup"
    end

    test "create_person/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Core.create_person(@invalid_attrs)
    end

    test "update_person/2 with valid data updates the person" do
      person = person_fixture()
      assert {:ok, person} = Core.update_person(person, @update_attrs)
      assert %Person{} = person
      assert person.age == 43
      assert person.bio == "some updated bio"
      assert person.birthday == DateTime.from_naive!(~N[2011-05-18 15:01:01.000000Z], "Etc/UTC")
      assert person.email == "some updated email"
      assert person.eventsCreated == 43
      assert person.gender == "some updated gender"
      assert person.lookingFor == "some updated lookingFor"
      assert person.messagesRecieved == 43
      assert person.messagesSent == 43
      assert person.name == "some updated name"
      assert person.nameFull == "some updated nameFull"
      assert person.password == "some updated password"
      assert person.poolsJoined == 43
      assert person.startedChats == 43
      assert person.uid == "7488a646-e31f-11e4-aace-600308960668"
      assert person.withA == "some updated withA"
      assert person.worstPickup == "some updated worstPickup"
    end

    test "update_person/2 with invalid data returns error changeset" do
      person = person_fixture()
      assert {:error, %Ecto.Changeset{}} = Core.update_person(person, @invalid_attrs)
      assert person == Core.get_person!(person.id)
    end

    test "delete_person/1 deletes the person" do
      person = person_fixture()
      assert {:ok, %Person{}} = Core.delete_person(person)
      assert_raise Ecto.NoResultsError, fn -> Core.get_person!(person.id) end
    end

    test "change_person/1 returns a person changeset" do
      person = person_fixture()
      assert %Ecto.Changeset{} = Core.change_person(person)
    end
  end
end
