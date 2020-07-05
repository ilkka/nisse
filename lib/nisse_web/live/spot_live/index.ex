defmodule NisseWeb.SpotLive.Index do
  use NisseWeb, :live_view

  alias Nisse.Plants
  alias Nisse.Plants.Spot

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :spots, list_spots())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Spot")
    |> assign(:spot, Plants.get_spot!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Spot")
    |> assign(:spot, %Spot{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Spots")
    |> assign(:spot, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    spot = Plants.get_spot!(id)
    {:ok, _} = Plants.delete_spot(spot)

    {:noreply, assign(socket, :spots, list_spots())}
  end

  defp list_spots do
    Plants.list_spots()
  end
end
