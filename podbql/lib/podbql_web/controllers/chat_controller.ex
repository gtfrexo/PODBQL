defmodule PodbqlWeb.ChatController do
  use PodbqlWeb, :controller

  alias Podbql.Chats
  alias Podbql.Chats.Chat

  action_fallback PodbqlWeb.FallbackController

  def index(conn, _params) do
    chats = Chats.list_chats()
    render(conn, "index.json", chats: chats)
  end

  def create(conn, %{"chat" => chat_params}) do
    with {:ok, %Chat{} = chat} <- Chats.create_chat(chat_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", chat_path(conn, :show, chat))
      |> render("show.json", chat: chat)
    end
  end

  def show(conn, %{"id" => id}) do
    chat = Chats.get_chat!(id)
    render(conn, "show.json", chat: chat)
  end

  def update(conn, %{"id" => id, "chat" => chat_params}) do
    chat = Chats.get_chat!(id)

    with {:ok, %Chat{} = chat} <- Chats.update_chat(chat, chat_params) do
      render(conn, "show.json", chat: chat)
    end
  end

  def delete(conn, %{"id" => id}) do
    chat = Chats.get_chat!(id)
    with {:ok, %Chat{}} <- Chats.delete_chat(chat) do
      send_resp(conn, :no_content, "")
    end
  end
end
