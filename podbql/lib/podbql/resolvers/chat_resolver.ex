defmodule Podbql.ChatResolver do

    alias Podbql.Chats

    def all(_args, _info) do
        {:ok, Chats.list_chats()}
    end

    def find(%{id: id}, _info) do
        case Chats.get_chat!(id) do
            nil -> {:error, "Chat with id: #{id} not found."}
            chat -> {:ok, chat}
        end
    end

end