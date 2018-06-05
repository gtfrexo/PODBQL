defmodule Podbql.MediaResolver do

    alias Podbql.Medias

    def all(_args, _info) do
        {:ok, Medias.list_medias()}
    end

    def find(%{id: id}, _info) do
        case Medias.get_media!(id) do
            nil -> {:error, "Media with id: #{id} not found."}
            media -> {:ok, media}
        end
    end

end