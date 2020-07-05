defmodule NisseWeb.PlantSpeciesLive.Show do
  use NisseWeb, :live_view

  alias Nisse.Plants

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:plant_species, Plants.get_plant_species!(id))}
  end

  defp page_title(:show), do: "Show Plant species"
  defp page_title(:edit), do: "Edit Plant species"
end
