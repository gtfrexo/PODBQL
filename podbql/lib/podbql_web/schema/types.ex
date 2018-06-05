defmodule PodbqlWeb.Schema.Types do
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

    object :location do
        
        field :id, :id
        field :address, :string
        field :addressFull, :string
        field :city, :string
        field :country, :string
        field :lat, :float
        field :lon, :float
        field :state, :string
        field :zip, :string

    end

    object :media do
        
        field :id, :id
        field :deletedAt, :utc_datetime
        field :description, :string
        field :mediaId, Ecto.UUID
        field :mediaType, :string
        field :url, :string

    end

    object :venue do
        
        field :id, :id
        field :category, :string
        field :description, :string
        field :eventsCreated, :integer
        field :name, :string
        field :nameFull, :string
        field :venueId, Ecto.UUID
        field :location, :id

        #many_to_many(:events, Podbql.Events.Event, join_through: "events_venues")
        #many_to_many(:hosts, Podbql.Hosts.Host, join_through: "hosts_venues")
        #many_to_many(:images, Podbql.Medias.Media, join_through: "images_venues")

    end

    object :event do
        
        field :id, :id
        field :category, :string
        field :description, :string
        field :endTime, :naive_datetime
        field :eventClicked, :integer
        field :eventId, Ecto.UUID
        field :poolClicked, :integer
        field :startTime, :naive_datetime
        field :title, :string
        field :titleFull, :string
        field :locationCreated, :id
        field :whoCreated, :id
        field :mainPic, :id

        #many_to_many :hosts, Podbql.Hosts.Host, join_through, "hosts_events"
        #many_to_many :images, Podbql.Medias.Media, join_through, "medias_events"
        #many_to_many :venues, Podbql.Venues.Venue, join_through, "venues_events"

    end

    object :host do
        
        field :id, :id
        field :createdEvents, :integer
        field :description, :string
        field :hostId, Ecto.UUID
        field :name, :string
        field :nameFull, :string

    end

    object :file do
        
        field :id, :id
        field :contentType, :string
        field :fileId, Ecto.UUID
        field :name, :string
        field :nameFull, :string
        field :secret, :string
        field :size, :integer
        field :url, :string

    end

    object :pool do
        
        field :id, :id
        field :influencedChats, :integer
        field :linkedEvent, :string
        field :poolId, Ecto.UUID

    end

    object :message do
        
        field :id, :id
        field :content, :string
        field :messageId, Ecto.UUID
        field :readAt, :utc_datetime
        field :wasRead, :boolean, default: false
        field :sender, :id
        field :sentTo, :id

    end

    object :chat do
        
        field :id, :id
        field :chatId, Ecto.UUID
        field :isBlocked, :boolean, default: false
        field :initiator, :id
        field :fromPool, :id

        field :messages, list_of(:message), resolve: assoc(:messages)
        field :persons, list_of(:person), resolve: assoc(:persons)

    end


end