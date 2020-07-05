defmodule NisseWeb.PlantSpeciesLive.Index do
  use NisseWeb, :live_view

  alias Nisse.Plants
  alias Nisse.Plants.PlantSpecies

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :plant_species_collection, list_plant_species())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Plant species")
    |> assign(:plant_species, Plants.get_plant_species!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Plant species")
    |> assign(:plant_species, %PlantSpecies{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Plant species")
    |> assign(:plant_species, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    plant_species = Plants.get_plant_species!(id)
    {:ok, _} = Plants.delete_plant_species(plant_species)

    {:noreply, assign(socket, :plant_species_collection, list_plant_species())}
  end

  defp list_plant_species do
    Plants.list_plant_species()
  end
end
