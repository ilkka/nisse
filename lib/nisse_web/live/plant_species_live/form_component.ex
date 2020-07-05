defmodule NisseWeb.PlantSpeciesLive.FormComponent do
  use NisseWeb, :live_component

  alias Nisse.Plants

  @impl true
  def update(%{plant_species: plant_species} = assigns, socket) do
    changeset = Plants.change_plant_species(plant_species)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"plant_species" => plant_species_params}, socket) do
    changeset =
      socket.assigns.plant_species
      |> Plants.change_plant_species(plant_species_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"plant_species" => plant_species_params}, socket) do
    save_plant_species(socket, socket.assigns.action, plant_species_params)
  end

  defp save_plant_species(socket, :edit, plant_species_params) do
    case Plants.update_plant_species(socket.assigns.plant_species, plant_species_params) do
      {:ok, _plant_species} ->
        {:noreply,
         socket
         |> put_flash(:info, "Plant species updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_plant_species(socket, :new, plant_species_params) do
    case Plants.create_plant_species(plant_species_params) do
      {:ok, _plant_species} ->
        {:noreply,
         socket
         |> put_flash(:info, "Plant species created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
