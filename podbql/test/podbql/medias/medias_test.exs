defmodule Podbql.MediasTest do
  use Podbql.DataCase

  alias Podbql.Medias

  describe "medias" do
    alias Podbql.Medias.Media

    @valid_attrs %{deletedAt: "2010-04-17 14:00:00.000000Z", description: "some description", mediaId: "7488a646-e31f-11e4-aace-600308960662", mediaType: "some mediaType", url: "some url"}
    @update_attrs %{deletedAt: "2011-05-18 15:01:01.000000Z", description: "some updated description", mediaId: "7488a646-e31f-11e4-aace-600308960668", mediaType: "some updated mediaType", url: "some updated url"}
    @invalid_attrs %{deletedAt: nil, description: nil, mediaId: nil, mediaType: nil, url: nil}

    def media_fixture(attrs \\ %{}) do
      {:ok, media} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Medias.create_media()

      media
    end

    test "list_medias/0 returns all medias" do
      media = media_fixture()
      assert Medias.list_medias() == [media]
    end

    test "get_media!/1 returns the media with given id" do
      media = media_fixture()
      assert Medias.get_media!(media.id) == media
    end

    test "create_media/1 with valid data creates a media" do
      assert {:ok, %Media{} = media} = Medias.create_media(@valid_attrs)
      assert media.deletedAt == DateTime.from_naive!(~N[2010-04-17 14:00:00.000000Z], "Etc/UTC")
      assert media.description == "some description"
      assert media.mediaId == "7488a646-e31f-11e4-aace-600308960662"
      assert media.mediaType == "some mediaType"
      assert media.url == "some url"
    end

    test "create_media/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Medias.create_media(@invalid_attrs)
    end

    test "update_media/2 with valid data updates the media" do
      media = media_fixture()
      assert {:ok, media} = Medias.update_media(media, @update_attrs)
      assert %Media{} = media
      assert media.deletedAt == DateTime.from_naive!(~N[2011-05-18 15:01:01.000000Z], "Etc/UTC")
      assert media.description == "some updated description"
      assert media.mediaId == "7488a646-e31f-11e4-aace-600308960668"
      assert media.mediaType == "some updated mediaType"
      assert media.url == "some updated url"
    end

    test "update_media/2 with invalid data returns error changeset" do
      media = media_fixture()
      assert {:error, %Ecto.Changeset{}} = Medias.update_media(media, @invalid_attrs)
      assert media == Medias.get_media!(media.id)
    end

    test "delete_media/1 deletes the media" do
      media = media_fixture()
      assert {:ok, %Media{}} = Medias.delete_media(media)
      assert_raise Ecto.NoResultsError, fn -> Medias.get_media!(media.id) end
    end

    test "change_media/1 returns a media changeset" do
      media = media_fixture()
      assert %Ecto.Changeset{} = Medias.change_media(media)
    end
  end
end
