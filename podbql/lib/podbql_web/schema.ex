defmodule PodbqlWeb.Schema do

    use Absinthe.Schema
    import_types PodbqlWeb.Schema.Types

    query do
        
        field :persons, list_of(:person) do
            resolve &Podbql.PersonResolver.all/2
        end

        field :person, type: :person do
            arg :id, non_null(:id)
            resolve &Podbql.Personresolver.find/2
        end

        field :locations, list_of(:location) do
            resolve &Podbql.LocationResolver.all/2
        end

        field :location, type: :location do
            arg :id, non_null(:id)
            resolve &Podbql.LocationResolver.find/2
        end

        field :medias, list_of(:media) do
            resolve &Podbql.MediaResolver.all/2
        end

        field :media, type: :media do
            arg :id, non_null(:id)
            resolve &Podbql.MediaResolver.find/2
        end

        field :venues, list_of(:venue) do
            resolve &Podbql.VenueResolver.all/2
        end

        field :venue, type: :venue do
            arg :id, non_null(:id)
            resolve &Podbql.VenueResolver.find/2
        end

        field :events, list_of(:event) do
            resolve &Podbql.EventResolver.all/2
        end

        field :event, type: :event do
            arg :id, non_null(:id)
            resolve &Podbql.EventResolver.find/2
        end

        field :hosts, list_of(:host) do
            resolve &Podbql.HostResolver.all/2
        end

        field :host, type: :host do
            arg :id, non_null(:id)
            resolve &Podbql.HostResolver.find/2
        end

        field :files, list_of(:file) do
            resolve &Podbql.FileResolver.all/2
        end

        field :file, type: :file do
            arg :id, non_null(:id)
            resolve &Podbql.FileResolver.find/2
        end

        field :pools, list_of(:pool) do
            resolve &Podbql.PoolResolver.all/2
        end

        field :pool, type: :pool do
            arg :id, non_null(:id)
            resolve &Podbql.PoolResolver.find/2
        end

        field :messages, list_of(:message) do
            resolve &Podbql.MessageResolver.all/2
        end

        field :message, type: :message do
            arg :id, non_null(:id)
            resolve &Podbql.MessageResolver.find/2
        end

        field :chats, list_of(:chat) do
            resolve &Podbql.ChatResolver.all/2
        end

        field :chat, type: :chat do
            arg :id, non_null(:id)
            resolve &Podbql.ChatResolver.find/2
        end

    end

end