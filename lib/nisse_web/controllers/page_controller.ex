defmodule NisseWeb.PageController do
  use NisseWeb, :controller

  def home(conn, _params) do
    # skip layout for this one
    render(conn, :home, layout: false)
  end
end
