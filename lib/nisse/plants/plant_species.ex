defmodule Nisse.Plants.PlantSpecies do
  use Ecto.Schema
  alias Nisse.Plants.Plant
  import Ecto.Changeset

  schema "plant_species" do
    field :care_instructions, :string
    field :common_name, :string
    field :name, :string
    has_many :plants, Plant, foreign_key: :species_id
    timestamps()
  end

  @doc false
  def changeset(plant_species, attrs) do
    plant_species
    |> cast(attrs, [:name, :common_name, :care_instructions])
    |> validate_required([:name, :common_name, :care_instructions])
  end
end
