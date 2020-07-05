defmodule Nisse.Repo.Migrations.AssociatePlantsWithSpots do
  use Ecto.Migration

  def change do
    alter table(:plants) do
      add :spot_id, references(:spots)
    end
  end
end
