defmodule Nisse.Plants.Plant do
  use Nisse.Schema
  alias Nisse.Plants.PlantSpecies
  import Ecto.Changeset

  schema "plants" do
    field :acquired_on, :date
    field :name, :string
    belongs_to :species, PlantSpecies
    timestamps()
  end

  @doc false
  def changeset(plant, attrs) do
    plant
    |> cast(attrs, [:name, :acquired_on, :species_id])
    |> validate_required([:name, :acquired_on])
  end
end
