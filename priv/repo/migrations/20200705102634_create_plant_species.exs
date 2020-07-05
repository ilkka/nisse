defmodule Nisse.Repo.Migrations.CreatePlantSpecies do
  use Ecto.Migration

  def change do
    create table(:plant_species) do
      add :name, :string
      add :common_name, :string
      add :care_instructions, :text

      timestamps()
    end

    alter table(:plants) do
      add :species_id, references(:plant_species)
    end
  end
end
