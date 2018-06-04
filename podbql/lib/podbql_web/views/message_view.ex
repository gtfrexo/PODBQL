defmodule PodbqlWeb.MessageView do
  use PodbqlWeb, :view
  alias PodbqlWeb.MessageView

  def render("index.json", %{messages: messages}) do
    %{data: render_many(messages, MessageView, "message.json")}
  end

  def render("show.json", %{message: message}) do
    %{data: render_one(message, MessageView, "message.json")}
  end

  def render("message.json", %{message: message}) do
    %{id: message.id,
      messageId: message.messageId,
      content: message.content,
      wasRead: message.wasRead,
      readAt: message.readAt}
  end
end
