defmodule Nisse.Repo.Migrations.CreateLightLevel do
  use Ecto.Migration

  @type_name "light_level"

  def change do
    execute(
      """
      CREATE TYPE #{@type_name}
      AS ENUM ('low', 'medium', 'high')
      """,
      "DROP TYPE #{@type_name}"
    )

    alter table(:spots) do
      add :light_level, :"#{@type_name}"
    end
  end
end
