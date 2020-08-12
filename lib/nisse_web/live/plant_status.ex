defmodule NisseWeb.PlantStatus do
  use NisseWeb, :live_component
  alias Nisse.Plants
  alias Nisse.Times

  @impl true
  def update(assigns, socket) do
    {:ok,
     socket
     |> assign(assigns)
     |> assign(:last_watered, last_watered(assigns.plant))}
  end

  @impl true
  def render(assigns) do
    ~L"""
    <div id="plant-status-<%= @id %>">
      <h3><%= @plant.name %></h3>
      <p>A
        <span><%= @plant.species.name %> (<%= @plant.species.common_name %>)</span>,
        location <span><%= @spot.label %></span>,
        last watered <span><%= @last_watered %></span>.
      </p>
      <div>
        <button phx-click="water" phx-value-id="<%= @plant.id %>" phx-target="<%= @myself %>">Water</button>
      </div>
    </div>
    """
  end

  @impl true
  def handle_event("water", %{"id" => plant_id}, socket) do
    {:ok, event} = Plants.create_plant_event(:water, plant_id)
    {:noreply, assign(socket, :last_watered, Times.format_relative!(event.inserted_at))}
  end

  defp last_watered(plant) do
    case Plants.last_watered(plant.id) do
      nil -> "never"
      timestamp -> Times.format_relative!(timestamp)
    end
  end
end
