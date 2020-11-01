defmodule Nisse.Plants.Plant do
  use Nisse.Schema
  import Ecto.Changeset

  schema "plants" do
    field :acquired_on, :date
    field :name, :string
    belongs_to :species, Nisse.Plants.PlantSpecies, foreign_key: :species_id
    belongs_to :spot, Nisse.Plants.Spot
    has_many :events, Nisse.Plants.PlantEvent
    belongs_to :pot, Nisse.Plants.Pot
    timestamps()
  end

  @doc false
  def changeset(plant, attrs) do
    plant
    |> cast(attrs, [:name, :acquired_on, :species_id, :spot_id, :pot_id])
    |> validate_required([:name, :acquired_on])
  end
end
