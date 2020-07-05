defmodule Nisse.Plants.Plant do
  use Ecto.Schema
  import Ecto.Changeset

  schema "plants" do
    field :acquired_on, :date
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(plant, attrs) do
    plant
    |> cast(attrs, [:name, :acquired_on])
    |> validate_required([:name, :acquired_on])
  end
end
