defmodule Nisse.Repo do
  use Ecto.Repo,
    otp_app: :nisse,
    adapter: Ecto.Adapters.Postgres
end
