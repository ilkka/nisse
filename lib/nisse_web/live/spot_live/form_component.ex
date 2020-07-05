defmodule NisseWeb.SpotLive.FormComponent do
  use NisseWeb, :live_component

  alias Nisse.Plants

  @impl true
  def update(%{spot: spot} = assigns, socket) do
    changeset = Plants.change_spot(spot)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"spot" => spot_params}, socket) do
    changeset =
      socket.assigns.spot
      |> Plants.change_spot(spot_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"spot" => spot_params}, socket) do
    save_spot(socket, socket.assigns.action, spot_params)
  end

  defp save_spot(socket, :edit, spot_params) do
    case Plants.update_spot(socket.assigns.spot, spot_params) do
      {:ok, _spot} ->
        {:noreply,
         socket
         |> put_flash(:info, "Spot updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_spot(socket, :new, spot_params) do
    case Plants.create_spot(spot_params) do
      {:ok, _spot} ->
        {:noreply,
         socket
         |> put_flash(:info, "Spot created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
