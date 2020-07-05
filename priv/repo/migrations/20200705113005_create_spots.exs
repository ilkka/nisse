defmodule Nisse.Repo.Migrations.CreateSpots do
  use Ecto.Migration

  def change do
    create table(:spots) do
      add :label, :string

      timestamps()
    end

  end
end
