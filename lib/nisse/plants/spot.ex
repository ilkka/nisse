defmodule Nisse.Plants.Spot do
  use Ecto.Schema
  import Ecto.Changeset

  schema "spots" do
    field :label, :string
    belongs_to :room, Nisse.Plants.Room
    has_many :plants, Nisse.Plants.Plant
    timestamps()
  end

  @doc false
  def changeset(spot, attrs) do
    spot
    |> cast(attrs, [:label, :room_id])
    |> validate_required([:label, :room_id])
  end
end
