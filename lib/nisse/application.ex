defmodule Nisse.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    config =
      Vapor.load!([
        %Vapor.Provider.Dotenv{overwrite: true},
        %Vapor.Provider.Env{
          bindings: [
            {:port, "PORT", default: 4000, map: &String.to_integer/1},
            {:hostname, "HOSTNAME", default: "localhost"},
            {:secret_key_base, "SECRET_KEY_BASE"},
            {:signing_salt, "SIGNING_SALT"}
          ]
        }
      ])

    children = [
      # Start the Ecto repository
      # (This gets configured via callback)
      Nisse.Repo,
      # Start the Telemetry supervisor
      NisseWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Nisse.PubSub},
      # Start the Endpoint (http/https)
      {NisseWeb.Endpoint,
       http: [port: config.port],
       url: [host: config.hostname, port: config.port],
       secret_key_base: config.secret_key_base,
       live_view: [signing_salt: config.signing_salt]}
      # Start a worker by calling: Nisse.Worker.start_link(arg)
      # {Nisse.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Nisse.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    NisseWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
