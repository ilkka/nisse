defmodule Nisse.Repo do
  use Ecto.Repo,
    otp_app: :nisse,
    adapter: Ecto.Adapters.Postgres

  def init(_type, config) do
    providers = [
      %Vapor.Provider.Dotenv{},
      %Vapor.Provider.Env{
        bindings: [
          {:url, "DB_URL"},
          {:pool_size, "DB_POOL_SIZE", default: 10, map: &String.to_integer/1}
        ]
      }
    ]

    updates = providers |> Vapor.load!() |> Map.to_list()

    {:ok, Keyword.merge(config, updates)}
  end
end
