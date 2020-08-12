defmodule NisseWeb.PlantStatus do
  use NisseWeb, :live_component
  alias Nisse.Plants
  alias Nisse.Times

  @impl true
  def render(assigns) do
    ~L"""
    <div id="plant-status-<%= @id %>">
      <h3><%= @plant.name %></h3>
      <p>A
        <span><%= @plant.species.name %> (<%= @plant.species.common_name %>)</span>,
        location <span><%= @spot.label %></span>,
        last watered <span><%= last_watered(@plant) %></span>.
      </p>
    </div>
    """
  end

  defp last_watered(plant) do
    case Plants.last_watered(plant.id) do
      nil -> "never"
      timestamp -> Times.format_relative!(timestamp)
    end
  end
end
