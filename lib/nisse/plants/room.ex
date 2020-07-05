defmodule Nisse.Plants.Room do
  use Ecto.Schema
  import Ecto.Changeset

  schema "rooms" do
    field :label, :string
    has_many :spots, Nisse.Plants.Spot
    timestamps()
  end

  @doc false
  def changeset(room, attrs) do
    room
    |> cast(attrs, [:label])
    |> validate_required([:label])
  end
end
