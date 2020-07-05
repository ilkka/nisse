defmodule NisseWeb.PageLiveTest do
  use NisseWeb.ConnCase

  import Phoenix.LiveViewTest

  test "disconnected and connected render", %{conn: conn} do
    {:ok, page_live, disconnected_html} = live(conn, "/")
    assert disconnected_html =~ "Nisse"
    assert render(page_live) =~ "Nisse"
  end
end
