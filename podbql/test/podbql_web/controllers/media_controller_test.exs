defmodule PodbqlWeb.MediaControllerTest do
  use PodbqlWeb.ConnCase

  alias Podbql.Medias
  alias Podbql.Medias.Media

  @create_attrs %{deletedAt: "2010-04-17 14:00:00.000000Z", description: "some description", mediaId: "7488a646-e31f-11e4-aace-600308960662", mediaType: "some mediaType", url: "some url"}
  @update_attrs %{deletedAt: "2011-05-18 15:01:01.000000Z", description: "some updated description", mediaId: "7488a646-e31f-11e4-aace-600308960668", mediaType: "some updated mediaType", url: "some updated url"}
  @invalid_attrs %{deletedAt: nil, description: nil, mediaId: nil, mediaType: nil, url: nil}

  def fixture(:media) do
    {:ok, media} = Medias.create_media(@create_attrs)
    media
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all medias", %{conn: conn} do
      conn = get conn, media_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create media" do
    test "renders media when data is valid", %{conn: conn} do
      conn = post conn, media_path(conn, :create), media: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, media_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "deletedAt" => "2010-04-17 14:00:00.000000Z",
        "description" => "some description",
        "mediaId" => "7488a646-e31f-11e4-aace-600308960662",
        "mediaType" => "some mediaType",
        "url" => "some url"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, media_path(conn, :create), media: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update media" do
    setup [:create_media]

    test "renders media when data is valid", %{conn: conn, media: %Media{id: id} = media} do
      conn = put conn, media_path(conn, :update, media), media: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, media_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "deletedAt" => "2011-05-18 15:01:01.000000Z",
        "description" => "some updated description",
        "mediaId" => "7488a646-e31f-11e4-aace-600308960668",
        "mediaType" => "some updated mediaType",
        "url" => "some updated url"}
    end

    test "renders errors when data is invalid", %{conn: conn, media: media} do
      conn = put conn, media_path(conn, :update, media), media: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete media" do
    setup [:create_media]

    test "deletes chosen media", %{conn: conn, media: media} do
      conn = delete conn, media_path(conn, :delete, media)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, media_path(conn, :show, media)
      end
    end
  end

  defp create_media(_) do
    media = fixture(:media)
    {:ok, media: media}
  end
end
