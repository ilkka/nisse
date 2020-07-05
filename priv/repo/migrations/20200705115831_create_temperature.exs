defmodule Nisse.Repo.Migrations.CreateTemperature do
  use Ecto.Migration

  @type_name "temperature"

  def change do
    execute(
      """
      CREATE TYPE #{@type_name}
      AS ENUM ('low', 'medium', 'high')
      """,
      "DROP TYPE #{@type_name}"
    )

    alter table(:spots) do
      add :temperature, :"#{@type_name}"
    end
  end
end
