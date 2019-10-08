defmodule ChitchatWeb.RoomChannel do
  use ChitchatWeb, :channel

  def join("room:lobby", _payload, socket) do
    {:ok, socket}
  end

  def join("room:" <> room, _payload, socket) do
    {:ok, assign(socket, :room, room)}
  end

  # It is also common to receive messages from the client and
  # broadcast to everyone in the current topic (room:lobby).
  def handle_in("shout", payload, socket) do
    broadcast socket, "shout", payload
    {:noreply, socket}
  end
end
