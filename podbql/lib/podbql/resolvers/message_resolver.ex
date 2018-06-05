defmodule Podbql.MessageResolver do

    alias Podbql.Messages

    def all(_args, _info) do
        {:ok, Messages.list_messages()}
    end

    def find(%{id: id}, _info) do
        case Messages.get_message!(id) do
            nil -> {:error, "Message with id: #{id} not found."}
            message -> {:ok, message}
        end
    end

end