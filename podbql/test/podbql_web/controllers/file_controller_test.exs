defmodule PodbqlWeb.FileControllerTest do
  use PodbqlWeb.ConnCase

  alias Podbql.Files
  alias Podbql.Files.File

  @create_attrs %{contentType: "some contentType", fileId: "7488a646-e31f-11e4-aace-600308960662", name: "some name", nameFull: "some nameFull", secret: "some secret", size: 42, url: "some url"}
  @update_attrs %{contentType: "some updated contentType", fileId: "7488a646-e31f-11e4-aace-600308960668", name: "some updated name", nameFull: "some updated nameFull", secret: "some updated secret", size: 43, url: "some updated url"}
  @invalid_attrs %{contentType: nil, fileId: nil, name: nil, nameFull: nil, secret: nil, size: nil, url: nil}

  def fixture(:file) do
    {:ok, file} = Files.create_file(@create_attrs)
    file
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all files", %{conn: conn} do
      conn = get conn, file_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create file" do
    test "renders file when data is valid", %{conn: conn} do
      conn = post conn, file_path(conn, :create), file: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, file_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "contentType" => "some contentType",
        "fileId" => "7488a646-e31f-11e4-aace-600308960662",
        "name" => "some name",
        "nameFull" => "some nameFull",
        "secret" => "some secret",
        "size" => 42,
        "url" => "some url"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, file_path(conn, :create), file: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update file" do
    setup [:create_file]

    test "renders file when data is valid", %{conn: conn, file: %File{id: id} = file} do
      conn = put conn, file_path(conn, :update, file), file: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, file_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "contentType" => "some updated contentType",
        "fileId" => "7488a646-e31f-11e4-aace-600308960668",
        "name" => "some updated name",
        "nameFull" => "some updated nameFull",
        "secret" => "some updated secret",
        "size" => 43,
        "url" => "some updated url"}
    end

    test "renders errors when data is invalid", %{conn: conn, file: file} do
      conn = put conn, file_path(conn, :update, file), file: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete file" do
    setup [:create_file]

    test "deletes chosen file", %{conn: conn, file: file} do
      conn = delete conn, file_path(conn, :delete, file)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, file_path(conn, :show, file)
      end
    end
  end

  defp create_file(_) do
    file = fixture(:file)
    {:ok, file: file}
  end
end
