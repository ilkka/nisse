defmodule Nisse.Plants.Spot do
  use Ecto.Schema
  import Ecto.Changeset

  schema "spots" do
    field :label, :string
    field :light_level, :string
    field :light_direction, :string
    field :temperature, :string
    belongs_to :room, Nisse.Plants.Room
    has_many :plants, Nisse.Plants.Plant
    timestamps()
  end

  @doc false
  def changeset(spot, attrs) do
    spot
    |> cast(attrs, [:label, :light_level, :light_direction, :temperature, :room_id])
    |> validate_required([:label, :room_id])
    |> validate_inclusion(:light_level, ~w(low medium high))
    |> validate_inclusion(:temperature, ~w(low medium high))
    |> validate_inclusion(:light_direction, ~w(N NE E SE S SW W NW))
  end
end
