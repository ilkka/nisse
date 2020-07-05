defmodule NisseWeb.PlantLive.Index do
  use NisseWeb, :live_view

  alias Nisse.Plants
  alias Nisse.Plants.Plant

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :plants, list_plants())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Plant")
    |> assign(:plant, Plants.get_plant!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Plant")
    |> assign(:plant, %Plant{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Plants")
    |> assign(:plant, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    plant = Plants.get_plant!(id)
    {:ok, _} = Plants.delete_plant(plant)

    {:noreply, assign(socket, :plants, list_plants())}
  end

  defp list_plants do
    Plants.list_plants()
  end
end
