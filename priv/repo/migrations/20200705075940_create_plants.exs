defmodule Nisse.Repo.Migrations.CreatePlants do
  use Ecto.Migration

  def change do
    create table(:plants) do
      add :name, :string
      add :acquired_on, :date

      timestamps()
    end

  end
end
