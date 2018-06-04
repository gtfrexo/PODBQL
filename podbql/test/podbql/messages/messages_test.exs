defmodule Podbql.MessagesTest do
  use Podbql.DataCase

  alias Podbql.Messages

  describe "messages" do
    alias Podbql.Messages.Message

    @valid_attrs %{content: "some content", messageId: "7488a646-e31f-11e4-aace-600308960662", readAt: "2010-04-17 14:00:00.000000Z", wasRead: true}
    @update_attrs %{content: "some updated content", messageId: "7488a646-e31f-11e4-aace-600308960668", readAt: "2011-05-18 15:01:01.000000Z", wasRead: false}
    @invalid_attrs %{content: nil, messageId: nil, readAt: nil, wasRead: nil}

    def message_fixture(attrs \\ %{}) do
      {:ok, message} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Messages.create_message()

      message
    end

    test "list_messages/0 returns all messages" do
      message = message_fixture()
      assert Messages.list_messages() == [message]
    end

    test "get_message!/1 returns the message with given id" do
      message = message_fixture()
      assert Messages.get_message!(message.id) == message
    end

    test "create_message/1 with valid data creates a message" do
      assert {:ok, %Message{} = message} = Messages.create_message(@valid_attrs)
      assert message.content == "some content"
      assert message.messageId == "7488a646-e31f-11e4-aace-600308960662"
      assert message.readAt == DateTime.from_naive!(~N[2010-04-17 14:00:00.000000Z], "Etc/UTC")
      assert message.wasRead == true
    end

    test "create_message/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Messages.create_message(@invalid_attrs)
    end

    test "update_message/2 with valid data updates the message" do
      message = message_fixture()
      assert {:ok, message} = Messages.update_message(message, @update_attrs)
      assert %Message{} = message
      assert message.content == "some updated content"
      assert message.messageId == "7488a646-e31f-11e4-aace-600308960668"
      assert message.readAt == DateTime.from_naive!(~N[2011-05-18 15:01:01.000000Z], "Etc/UTC")
      assert message.wasRead == false
    end

    test "update_message/2 with invalid data returns error changeset" do
      message = message_fixture()
      assert {:error, %Ecto.Changeset{}} = Messages.update_message(message, @invalid_attrs)
      assert message == Messages.get_message!(message.id)
    end

    test "delete_message/1 deletes the message" do
      message = message_fixture()
      assert {:ok, %Message{}} = Messages.delete_message(message)
      assert_raise Ecto.NoResultsError, fn -> Messages.get_message!(message.id) end
    end

    test "change_message/1 returns a message changeset" do
      message = message_fixture()
      assert %Ecto.Changeset{} = Messages.change_message(message)
    end
  end
end
