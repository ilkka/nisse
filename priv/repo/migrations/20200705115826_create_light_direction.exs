defmodule Nisse.Repo.Migrations.CreateLightDirection do
  use Ecto.Migration

  @type_name "light_direction"

  def change do
    execute(
      """
      CREATE TYPE #{@type_name}
      AS ENUM ('N', 'NE', 'E', 'SE', 'S', 'SW', 'W', 'NW')
      """,
      "DROP TYPE #{@type_name}"
    )

    alter table(:spots) do
      add :light_direction, :"#{@type_name}"
    end
  end
end
