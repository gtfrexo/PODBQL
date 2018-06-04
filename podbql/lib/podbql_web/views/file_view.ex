defmodule PodbqlWeb.FileView do
  use PodbqlWeb, :view
  alias PodbqlWeb.FileView

  def render("index.json", %{files: files}) do
    %{data: render_many(files, FileView, "file.json")}
  end

  def render("show.json", %{file: file}) do
    %{data: render_one(file, FileView, "file.json")}
  end

  def render("file.json", %{file: file}) do
    %{id: file.id,
      fileId: file.fileId,
      name: file.name,
      nameFull: file.nameFull,
      secret: file.secret,
      size: file.size,
      url: file.url,
      contentType: file.contentType}
  end
end
