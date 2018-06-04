defmodule PodbqlWeb.MediaView do
  use PodbqlWeb, :view
  alias PodbqlWeb.MediaView

  def render("index.json", %{medias: medias}) do
    %{data: render_many(medias, MediaView, "media.json")}
  end

  def render("show.json", %{media: media}) do
    %{data: render_one(media, MediaView, "media.json")}
  end

  def render("media.json", %{media: media}) do
    %{id: media.id,
      mediaId: media.mediaId,
      mediaType: media.mediaType,
      url: media.url,
      description: media.description,
      deletedAt: media.deletedAt}
  end
end
