defmodule Nisse.Plants.Pot do
  use Ecto.Schema
  import Ecto.Changeset

  schema "pots" do
    field :label, :string
    field :type, :string
    has_one(:plant, Nisse.Plants.Plant)
    timestamps()
  end

  @doc false
  def changeset(pot, attrs) do
    pot
    |> cast(attrs, [:label, :type])
    |> validate_required([:label, :type])
    |> validate_inclusion(:type, ~w(normal self_watering))
  end
end
