defmodule NisseWeb.PlantLive.FormComponent do
  use NisseWeb, :live_component

  alias Nisse.Plants
  alias Nisse.Plants

  @impl true
  def mount(socket) do
    {:ok, assign(socket, all_species: list_plant_species(), spots: list_spots())}
  end

  @impl true
  def update(%{plant: plant} = assigns, socket) do
    changeset = Plants.change_plant(plant)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"plant" => plant_params}, socket) do
    changeset =
      socket.assigns.plant
      |> Plants.change_plant(plant_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"plant" => plant_params}, socket) do
    save_plant(socket, socket.assigns.action, plant_params)
  end

  defp save_plant(socket, :edit, plant_params) do
    case Plants.update_plant(socket.assigns.plant, plant_params) do
      {:ok, _plant} ->
        {:noreply,
         socket
         |> put_flash(:info, "Plant updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_plant(socket, :new, plant_params) do
    case Plants.create_plant(plant_params) do
      {:ok, _plant} ->
        {:noreply,
         socket
         |> put_flash(:info, "Plant created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end

  defp list_plant_species() do
    Plants.list_plant_species()
  end

  defp list_spots() do
    Plants.list_spots()
  end
end
