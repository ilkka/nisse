defmodule Nisse.Repo.Migrations.CreatePlantEvents do
  use Ecto.Migration

  def change do
    create table(:plant_events) do
      add :note, :string
      add :plant_id, references(:plants)

      timestamps()
    end

  end
end
