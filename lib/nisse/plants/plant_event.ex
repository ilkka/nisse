defmodule Nisse.Plants.PlantEvent do
  use Ecto.Schema
  import Ecto.Changeset

  schema "plant_events" do
    field :note, :string
    field :type, :string
    belongs_to :plant, Nisse.Plants.Plant
    timestamps()
  end

  @doc false
  def changeset(plant_event, attrs) do
    plant_event
    |> cast(attrs, [:note, :type, :plant_id])
    |> validate_required([:note, :type, :plant_id])
    |> validate_inclusion(:type, ~w(water spray wipe water_tank pot trim fertilize move observation))
  end
end
