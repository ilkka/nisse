defmodule Nisse.Repo.Migrations.CreatePots do
  use Ecto.Migration

  @type_name "pot_type"

  def change do
    execute(
      """
      CREATE TYPE #{@type_name}
      AS ENUM ('normal', 'self_watering')
      """,
      "DROP TYPE #{@type_name}"
    )

    create table(:pots) do
      add :label, :string
      add :type, :"#{@type_name}"
      timestamps()
    end

    alter table(:plants) do
      add :pot_id, references(:pots), null: true
    end
  end
end
