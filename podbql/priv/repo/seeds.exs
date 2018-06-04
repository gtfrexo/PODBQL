# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Podbql.Repo.insert!(%Podbql.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias Graphical.Accounts
alias Graphical.Posts

Persons.create_person(%[name: "Gavin", nameFull: "Gavin Rose", gender: "male"])