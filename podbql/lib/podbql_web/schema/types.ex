module PodbqlWeb.Schema.Types do
    use Absinthe.Schema.Notation
    use Absinthe.Ecto, repo: Podbql.Repo

    object :person do

        field :id, :id
        field :age, :integer
        field :birthday, :utc_datetime
        field :currentlyBlocking, {:array, Ecto.UUID}
        field :email, :string
        field :eventsCreated, :integer
        field :gender, :string
        field :messagesRecieved, :integer
        field :messagesSent, :integer
        field :name, :string
        field :nameFull, :string
        field :password, :string
        field :poolsJoined, :integer
        field :startedChats, :integer
        field :targetGender, :string
        field :targetRelationship, :string
        field :uid, Ecto.UUID
        field :worstPickup, :string

        field :createdEvents, list_of(:event), resolve: assoc(:events)
        field :createdChats, list_of(:chat), resolve: assoc(:chats)
        field :joinedPools, list_of(:pool), resolve: assoc(:pools)

    end


end