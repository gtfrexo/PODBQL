defmodule PodbqlWeb.PersonView do
  use PodbqlWeb, :view
  alias PodbqlWeb.PersonView

  def render("index.json", %{persons: persons}) do
    %{data: render_many(persons, PersonView, "person.json")}
  end

  def render("show.json", %{person: person}) do
    %{data: render_one(person, PersonView, "person.json")}
  end

  def render("person.json", %{person: person}) do
    %{id: person.id,
      uid: person.uid,
      name: person.name,
      nameFull: person.nameFull,
      gender: person.gender,
      birthday: person.birthday,
      age: person.age,
      targetRelationship: person.targetRelationship,
      targetGender: person.targetGender,
      worstPickup: person.worstPickup,
      email: person.email,
      password: person.password,
      poolsJoined: person.poolsJoined,
      startedChats: person.startedChats,
      currentlyBlocking: person.currentlyBlocking,
      messagesSent: person.messagesSent,
      messagesRecieved: person.messagesRecieved,
      eventsCreated: person.eventsCreated}
  end
end
