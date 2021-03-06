defmodule PodbqlWeb.HostControllerTest do
  use PodbqlWeb.ConnCase

  alias Podbql.Hosts
  alias Podbql.Hosts.Host

  @create_attrs %{createdEvents: 42, description: "some description", hostId: "7488a646-e31f-11e4-aace-600308960662", name: "some name", nameFull: "some nameFull"}
  @update_attrs %{createdEvents: 43, description: "some updated description", hostId: "7488a646-e31f-11e4-aace-600308960668", name: "some updated name", nameFull: "some updated nameFull"}
  @invalid_attrs %{createdEvents: nil, description: nil, hostId: nil, name: nil, nameFull: nil}

  def fixture(:host) do
    {:ok, host} = Hosts.create_host(@create_attrs)
    host
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all hosts", %{conn: conn} do
      conn = get conn, host_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create host" do
    test "renders host when data is valid", %{conn: conn} do
      conn = post conn, host_path(conn, :create), host: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, host_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "createdEvents" => 42,
        "description" => "some description",
        "hostId" => "7488a646-e31f-11e4-aace-600308960662",
        "name" => "some name",
        "nameFull" => "some nameFull"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, host_path(conn, :create), host: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update host" do
    setup [:create_host]

    test "renders host when data is valid", %{conn: conn, host: %Host{id: id} = host} do
      conn = put conn, host_path(conn, :update, host), host: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, host_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "createdEvents" => 43,
        "description" => "some updated description",
        "hostId" => "7488a646-e31f-11e4-aace-600308960668",
        "name" => "some updated name",
        "nameFull" => "some updated nameFull"}
    end

    test "renders errors when data is invalid", %{conn: conn, host: host} do
      conn = put conn, host_path(conn, :update, host), host: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete host" do
    setup [:create_host]

    test "deletes chosen host", %{conn: conn, host: host} do
      conn = delete conn, host_path(conn, :delete, host)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, host_path(conn, :show, host)
      end
    end
  end

  defp create_host(_) do
    host = fixture(:host)
    {:ok, host: host}
  end
end
