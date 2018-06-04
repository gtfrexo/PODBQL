defmodule Podbql.Files.File do
  use Ecto.Schema
  import Ecto.Changeset


  schema "files" do
    field :contentType, :string
    field :fileId, Ecto.UUID
    field :name, :string
    field :nameFull, :string
    field :secret, :string
    field :size, :integer
    field :url, :string

    timestamps()
  end

  @doc false
  def changeset(file, attrs) do
    file
    |> cast(attrs, [:fileId, :name, :nameFull, :secret, :size, :url, :contentType])
    |> validate_required([:fileId, :name, :nameFull, :secret, :size, :url, :contentType])
  end
end
