defmodule Podbql.FileResolver do

    alias Podbql.Files

    def all(_args, _info) do
        {:ok, Files.list_files()}
    end

    def find(%{id: id}, _info) do
        case Files.get_file!(id) do
            nil -> {:error, "File with id: #{id} not found."}
            file -> {:ok, file}
        end
    end

end