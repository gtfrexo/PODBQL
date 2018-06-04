defmodule Podbql.FilesTest do
  use Podbql.DataCase

  alias Podbql.Files

  describe "files" do
    alias Podbql.Files.File

    @valid_attrs %{contentType: "some contentType", fileId: "7488a646-e31f-11e4-aace-600308960662", name: "some name", nameFull: "some nameFull", secret: "some secret", size: 42, url: "some url"}
    @update_attrs %{contentType: "some updated contentType", fileId: "7488a646-e31f-11e4-aace-600308960668", name: "some updated name", nameFull: "some updated nameFull", secret: "some updated secret", size: 43, url: "some updated url"}
    @invalid_attrs %{contentType: nil, fileId: nil, name: nil, nameFull: nil, secret: nil, size: nil, url: nil}

    def file_fixture(attrs \\ %{}) do
      {:ok, file} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Files.create_file()

      file
    end

    test "list_files/0 returns all files" do
      file = file_fixture()
      assert Files.list_files() == [file]
    end

    test "get_file!/1 returns the file with given id" do
      file = file_fixture()
      assert Files.get_file!(file.id) == file
    end

    test "create_file/1 with valid data creates a file" do
      assert {:ok, %File{} = file} = Files.create_file(@valid_attrs)
      assert file.contentType == "some contentType"
      assert file.fileId == "7488a646-e31f-11e4-aace-600308960662"
      assert file.name == "some name"
      assert file.nameFull == "some nameFull"
      assert file.secret == "some secret"
      assert file.size == 42
      assert file.url == "some url"
    end

    test "create_file/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Files.create_file(@invalid_attrs)
    end

    test "update_file/2 with valid data updates the file" do
      file = file_fixture()
      assert {:ok, file} = Files.update_file(file, @update_attrs)
      assert %File{} = file
      assert file.contentType == "some updated contentType"
      assert file.fileId == "7488a646-e31f-11e4-aace-600308960668"
      assert file.name == "some updated name"
      assert file.nameFull == "some updated nameFull"
      assert file.secret == "some updated secret"
      assert file.size == 43
      assert file.url == "some updated url"
    end

    test "update_file/2 with invalid data returns error changeset" do
      file = file_fixture()
      assert {:error, %Ecto.Changeset{}} = Files.update_file(file, @invalid_attrs)
      assert file == Files.get_file!(file.id)
    end

    test "delete_file/1 deletes the file" do
      file = file_fixture()
      assert {:ok, %File{}} = Files.delete_file(file)
      assert_raise Ecto.NoResultsError, fn -> Files.get_file!(file.id) end
    end

    test "change_file/1 returns a file changeset" do
      file = file_fixture()
      assert %Ecto.Changeset{} = Files.change_file(file)
    end
  end
end
