defmodule NisseWeb.PlantStatus do
  @moduledoc """
  A liveview component for showing the status of one plant and some basic controls.
  """
  use NisseWeb, :live_component
  alias Nisse.Plants
  alias Nisse.Times
  alias Nisse.Plants.{Plant, Pot}

  @impl true
  def update(assigns, socket) do
    {water_event, water_label} = water_type(assigns.plant)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:last_watered, last_watered(assigns.plant))
     |> assign(:water_event, water_event)
     |> assign(:water_label, water_label)}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div id={"plant-status-#{@id}"}>
      <h3><%= @plant.name %></h3>
      <p>A
        <span><%= @plant.species.name %> (<%= @plant.species.common_name %>)</span>,
        location <span><%= @spot.label %></span>,
        last watered <span><%= @last_watered %></span>.
      </p>
      <div>
        <button phx-click={@water_event} phx-value-id={@plant.id} phx-target={@myself}><%= @water_label %></button>
        <button phx-click="spray" phx-value-id={@plant.id} phx-target={@myself}>Spray</button>
        <button phx-click="wipe" phx-value-id={@plant.id} phx-target={@myself}>Wipe leaves</button>
      </div>
    </div>
    """
  end

  @impl true
  def handle_event("water", %{"id" => plant_id}, socket) do
    {:ok, event} = Plants.create_plant_event(:water, plant_id)
    {:noreply, assign(socket, :last_watered, Times.format_relative!(event.inserted_at))}
  end

  @impl true
  def handle_event("water_tank", %{"id" => plant_id}, socket) do
    {:ok, event} = Plants.create_plant_event(:water_tank, plant_id)
    {:noreply, assign(socket, :last_watered, Times.format_relative!(event.inserted_at))}
  end

  @impl true
  def handle_event("wipe", %{"id" => plant_id}, socket) do
    {:ok, event} = Plants.create_plant_event(:wipe, plant_id)
    {:noreply, socket}
  end

  defp last_watered(%Plant{} = plant) do
    case Plants.last_watered(plant.id) do
      nil -> "never"
      timestamp -> Times.format_relative!(timestamp)
    end
  end

  defp water_type(%Plant{pot: %Pot{type: "normal"}}) do
    {"water", "Water"}
  end

  defp water_type(%Plant{pot: %Pot{type: "self_watering"}}) do
    {"water_tank", "Fill tank"}
  end

  defp water_type(%Plant{}) do
    {"water", "Water"}
  end
end
