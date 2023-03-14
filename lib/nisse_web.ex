defmodule NisseWeb do
  @moduledoc """
  The entrypoint for defining your web interface, such
  as controllers, views, channels and so on.
  
  This can be used in your application as:
  
      use NisseWeb, :controller
      use NisseWeb, :html
  
  The definitions below will be executed for every view,
  controller, etc, so keep them short and clean, focused
  on imports, uses and aliases.
  
  Do NOT define functions inside the quoted expressions
  below. Instead, define any helper function in modules
  and import those modules here.
  """

  def static_paths, do: ~w(assets fonts images favicon.ico robots.txt)
  
  # done
  def controller do
    quote do
      use Phoenix.Controller,
        formats: [:html, :json],
        layouts: [html: NisseWeb.Layouts],
        namespace: NisseWeb

      import Plug.Conn
      import NisseWeb.Gettext

      unquote(verified_routes())
    end
  end

  # done
  def html do
    quote do
      use Phoenix.Component
      
      # Import convenience functions from controllers
      import Phoenix.Controller,
        only: [get_csrf_token: 0, get_flash: 1, get_flash: 2, view_module: 1, view_template: 1]

      # Include general helpers for rendering HTML
      unquote(html_helpers())
    end
  end

  # done
  def live_view do
    quote do
      use Phoenix.LiveView,
        layout: {NisseWeb.Layouts, :app}

      unquote(html_helpers())
    end
  end

  def live_component do
    quote do
      use Phoenix.LiveComponent

      unquote(html_helpers())
    end
  end

  # done
  def router do
    quote do
      use Phoenix.Router, helpers: false

      import Plug.Conn
      import Phoenix.Controller
      import Phoenix.LiveView.Router
    end
  end

  # done
  def channel do
    quote do
      use Phoenix.Channel
    end
  end

  defp html_helpers do
    quote do
      # Use all HTML functionality (forms, tags, etc)
      use Phoenix.HTML

      # Import LiveView helpers
      import Phoenix.Component
      import NisseWeb.LiveHelpers

      import NisseWeb.ErrorHelpers
      import NisseWeb.Gettext
      alias NisseWeb.Router.Helpers, as: Routes

      unquote(verified_routes())
    end
  end

  # done
  def verified_routes do
    quote do
      use Phoenix.VerifiedRoutes,
        endpoint: NisseWeb.Endpoint,
        router: NisseWeb.Router,
        statics: NisseWeb.static_paths()
    end
  end

  @doc """
  When used, dispatch to the appropriate controller/view/etc.
  """
  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end
