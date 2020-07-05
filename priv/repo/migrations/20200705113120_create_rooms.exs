defmodule Nisse.Repo.Migrations.CreateRooms do
  use Ecto.Migration

  def change do
    create table(:rooms) do
      add :label, :string

      timestamps()
    end

    alter table(:spots) do
      add :room_id, references(:rooms)
    end
  end
end
