defmodule NisseWeb.Router do
  use NisseWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {NisseWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", NisseWeb do
    pipe_through :browser

    live "/", PageLive, :index

    # Plants
    live "/plants", PlantLive.Index, :index
    live "/plants/new", PlantLive.Index, :new
    live "/plants/:id/edit", PlantLive.Index, :edit

    live "/plants/:id", PlantLive.Show, :show
    live "/plants/:id/show/edit", PlantLive.Show, :edit

    # Species
    live "/plant_species", PlantSpeciesLive.Index, :index
    live "/plant_species/new", PlantSpeciesLive.Index, :new
    live "/plant_species/:id/edit", PlantSpeciesLive.Index, :edit

    live "/plant_species/:id", PlantSpeciesLive.Show, :show
    live "/plant_species/:id/show/edit", PlantSpeciesLive.Show, :edit

    # Spots
    live "/spots", SpotLive.Index, :index
    live "/spots/new", SpotLive.Index, :new
    live "/spots/:id/edit", SpotLive.Index, :edit

    live "/spots/:id", SpotLive.Show, :show
    live "/spots/:id/show/edit", SpotLive.Show, :edit

    # Rooms
    live "/rooms", RoomLive.Index, :index
    live "/rooms/new", RoomLive.Index, :new
    live "/rooms/:id/edit", RoomLive.Index, :edit

    live "/rooms/:id", RoomLive.Show, :show
    live "/rooms/:id/show/edit", RoomLive.Show, :edit
  end

  # Other scopes may use custom stacks.
  # scope "/api", NisseWeb do
  #   pipe_through :api
  # end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser
      live_dashboard "/dashboard", metrics: NisseWeb.Telemetry
    end
  end
end
