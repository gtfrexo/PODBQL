defmodule Podbql.ChatsTest do
  use Podbql.DataCase

  alias Podbql.Chats

  describe "chats" do
    alias Podbql.Chats.Chat

    @valid_attrs %{chatId: "7488a646-e31f-11e4-aace-600308960662", isBlocked: true}
    @update_attrs %{chatId: "7488a646-e31f-11e4-aace-600308960668", isBlocked: false}
    @invalid_attrs %{chatId: nil, isBlocked: nil}

    def chat_fixture(attrs \\ %{}) do
      {:ok, chat} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Chats.create_chat()

      chat
    end

    test "list_chats/0 returns all chats" do
      chat = chat_fixture()
      assert Chats.list_chats() == [chat]
    end

    test "get_chat!/1 returns the chat with given id" do
      chat = chat_fixture()
      assert Chats.get_chat!(chat.id) == chat
    end

    test "create_chat/1 with valid data creates a chat" do
      assert {:ok, %Chat{} = chat} = Chats.create_chat(@valid_attrs)
      assert chat.chatId == "7488a646-e31f-11e4-aace-600308960662"
      assert chat.isBlocked == true
    end

    test "create_chat/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Chats.create_chat(@invalid_attrs)
    end

    test "update_chat/2 with valid data updates the chat" do
      chat = chat_fixture()
      assert {:ok, chat} = Chats.update_chat(chat, @update_attrs)
      assert %Chat{} = chat
      assert chat.chatId == "7488a646-e31f-11e4-aace-600308960668"
      assert chat.isBlocked == false
    end

    test "update_chat/2 with invalid data returns error changeset" do
      chat = chat_fixture()
      assert {:error, %Ecto.Changeset{}} = Chats.update_chat(chat, @invalid_attrs)
      assert chat == Chats.get_chat!(chat.id)
    end

    test "delete_chat/1 deletes the chat" do
      chat = chat_fixture()
      assert {:ok, %Chat{}} = Chats.delete_chat(chat)
      assert_raise Ecto.NoResultsError, fn -> Chats.get_chat!(chat.id) end
    end

    test "change_chat/1 returns a chat changeset" do
      chat = chat_fixture()
      assert %Ecto.Changeset{} = Chats.change_chat(chat)
    end
  end
end
