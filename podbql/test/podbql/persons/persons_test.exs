defmodule Podbql.PersonsTest do
  use Podbql.DataCase

  alias Podbql.Persons

  describe "persons" do
    alias Podbql.Persons.Person

    @valid_attrs %{age: 42, birthday: "2010-04-17 14:00:00.000000Z", currentlyBlocking: [], email: "some email", eventsCreated: 42, gender: "some gender", messagesRecieved: 42, messagesSent: 42, name: "some name", nameFull: "some nameFull", password: "some password", poolsJoined: 42, startedChats: 42, targetGender: "some targetGender", targetRelationship: "some targetRelationship", uid: "7488a646-e31f-11e4-aace-600308960662", worstPickup: "some worstPickup"}
    @update_attrs %{age: 43, birthday: "2011-05-18 15:01:01.000000Z", currentlyBlocking: [], email: "some updated email", eventsCreated: 43, gender: "some updated gender", messagesRecieved: 43, messagesSent: 43, name: "some updated name", nameFull: "some updated nameFull", password: "some updated password", poolsJoined: 43, startedChats: 43, targetGender: "some updated targetGender", targetRelationship: "some updated targetRelationship", uid: "7488a646-e31f-11e4-aace-600308960668", worstPickup: "some updated worstPickup"}
    @invalid_attrs %{age: nil, birthday: nil, currentlyBlocking: nil, email: nil, eventsCreated: nil, gender: nil, messagesRecieved: nil, messagesSent: nil, name: nil, nameFull: nil, password: nil, poolsJoined: nil, startedChats: nil, targetGender: nil, targetRelationship: nil, uid: nil, worstPickup: nil}

    def person_fixture(attrs \\ %{}) do
      {:ok, person} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Persons.create_person()

      person
    end

    test "list_persons/0 returns all persons" do
      person = person_fixture()
      assert Persons.list_persons() == [person]
    end

    test "get_person!/1 returns the person with given id" do
      person = person_fixture()
      assert Persons.get_person!(person.id) == person
    end

    test "create_person/1 with valid data creates a person" do
      assert {:ok, %Person{} = person} = Persons.create_person(@valid_attrs)
      assert person.age == 42
      assert person.birthday == DateTime.from_naive!(~N[2010-04-17 14:00:00.000000Z], "Etc/UTC")
      assert person.currentlyBlocking == []
      assert person.email == "some email"
      assert person.eventsCreated == 42
      assert person.gender == "some gender"
      assert person.messagesRecieved == 42
      assert person.messagesSent == 42
      assert person.name == "some name"
      assert person.nameFull == "some nameFull"
      assert person.password == "some password"
      assert person.poolsJoined == 42
      assert person.startedChats == 42
      assert person.targetGender == "some targetGender"
      assert person.targetRelationship == "some targetRelationship"
      assert person.uid == "7488a646-e31f-11e4-aace-600308960662"
      assert person.worstPickup == "some worstPickup"
    end

    test "create_person/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Persons.create_person(@invalid_attrs)
    end

    test "update_person/2 with valid data updates the person" do
      person = person_fixture()
      assert {:ok, person} = Persons.update_person(person, @update_attrs)
      assert %Person{} = person
      assert person.age == 43
      assert person.birthday == DateTime.from_naive!(~N[2011-05-18 15:01:01.000000Z], "Etc/UTC")
      assert person.currentlyBlocking == []
      assert person.email == "some updated email"
      assert person.eventsCreated == 43
      assert person.gender == "some updated gender"
      assert person.messagesRecieved == 43
      assert person.messagesSent == 43
      assert person.name == "some updated name"
      assert person.nameFull == "some updated nameFull"
      assert person.password == "some updated password"
      assert person.poolsJoined == 43
      assert person.startedChats == 43
      assert person.targetGender == "some updated targetGender"
      assert person.targetRelationship == "some updated targetRelationship"
      assert person.uid == "7488a646-e31f-11e4-aace-600308960668"
      assert person.worstPickup == "some updated worstPickup"
    end

    test "update_person/2 with invalid data returns error changeset" do
      person = person_fixture()
      assert {:error, %Ecto.Changeset{}} = Persons.update_person(person, @invalid_attrs)
      assert person == Persons.get_person!(person.id)
    end

    test "delete_person/1 deletes the person" do
      person = person_fixture()
      assert {:ok, %Person{}} = Persons.delete_person(person)
      assert_raise Ecto.NoResultsError, fn -> Persons.get_person!(person.id) end
    end

    test "change_person/1 returns a person changeset" do
      person = person_fixture()
      assert %Ecto.Changeset{} = Persons.change_person(person)
    end
  end
end
