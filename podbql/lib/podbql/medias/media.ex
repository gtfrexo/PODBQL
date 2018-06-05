defmodule Podbql.Medias.Media do
  use Ecto.Schema
  import Ecto.Changeset


  schema "medias" do
    field :deletedAt, :utc_datetime
    field :description, :string
    #field :mediaId, Ecto.UUID
    field :mediaType, :string
    field :url, :string

    timestamps()
  end

  @doc false
  def changeset(media, attrs) do
    media
    |> cast(attrs, [:mediaId, :mediaType, :url, :description, :deletedAt])
    |> validate_required([:mediaId, :mediaType, :url, :description, :deletedAt])
  end
end
