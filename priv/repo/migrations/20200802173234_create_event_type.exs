defmodule Nisse.Repo.Migrations.CreateEventType do
  use Ecto.Migration

  @type_name "plant_event_type"

  def change do
    execute(
      """
      CREATE TYPE #{@type_name}
      AS ENUM ('water', 'spray', 'wipe', 'water_tank', 'pot', 'trim', 'fertilize', 'move', 'observation')
      """,
      "DROP TYPE #{@type_name}"
    )

    alter table(:plant_events) do
      add :type, :"#{@type_name}"
    end
  end
end
