defmodule Nisse.Plants.Spot do
  use Ecto.Schema
  import Ecto.Changeset

  schema "spots" do
    field :label, :string

    timestamps()
  end

  @doc false
  def changeset(spot, attrs) do
    spot
    |> cast(attrs, [:label])
    |> validate_required([:label])
  end
end
