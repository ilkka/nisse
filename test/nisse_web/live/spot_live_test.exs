defmodule NisseWeb.SpotLiveTest do
  use NisseWeb.ConnCase

  import Phoenix.LiveViewTest

  alias Nisse.Plants

  @create_attrs %{label: "some label"}
  @update_attrs %{label: "some updated label"}
  @invalid_attrs %{label: nil}

  defp fixture(:spot) do
    {:ok, spot} = Plants.create_spot(@create_attrs)
    spot
  end

  defp create_spot(_) do
    spot = fixture(:spot)
    %{spot: spot}
  end

  describe "Index" do
    setup [:create_spot]

    test "lists all spots", %{conn: conn, spot: spot} do
      {:ok, _index_live, html} = live(conn, Routes.spot_index_path(conn, :index))

      assert html =~ "Listing Spots"
      assert html =~ spot.label
    end

    test "saves new spot", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.spot_index_path(conn, :index))

      assert index_live |> element("a", "New Spot") |> render_click() =~
               "New Spot"

      assert_patch(index_live, Routes.spot_index_path(conn, :new))

      assert index_live
             |> form("#spot-form", spot: @invalid_attrs)
             |> render_change() =~ "can&apos;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#spot-form", spot: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.spot_index_path(conn, :index))

      assert html =~ "Spot created successfully"
      assert html =~ "some label"
    end

    test "updates spot in listing", %{conn: conn, spot: spot} do
      {:ok, index_live, _html} = live(conn, Routes.spot_index_path(conn, :index))

      assert index_live |> element("#spot-#{spot.id} a", "Edit") |> render_click() =~
               "Edit Spot"

      assert_patch(index_live, Routes.spot_index_path(conn, :edit, spot))

      assert index_live
             |> form("#spot-form", spot: @invalid_attrs)
             |> render_change() =~ "can&apos;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#spot-form", spot: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.spot_index_path(conn, :index))

      assert html =~ "Spot updated successfully"
      assert html =~ "some updated label"
    end

    test "deletes spot in listing", %{conn: conn, spot: spot} do
      {:ok, index_live, _html} = live(conn, Routes.spot_index_path(conn, :index))

      assert index_live |> element("#spot-#{spot.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#spot-#{spot.id}")
    end
  end

  describe "Show" do
    setup [:create_spot]

    test "displays spot", %{conn: conn, spot: spot} do
      {:ok, _show_live, html} = live(conn, Routes.spot_show_path(conn, :show, spot))

      assert html =~ "Show Spot"
      assert html =~ spot.label
    end

    test "updates spot within modal", %{conn: conn, spot: spot} do
      {:ok, show_live, _html} = live(conn, Routes.spot_show_path(conn, :show, spot))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Spot"

      assert_patch(show_live, Routes.spot_show_path(conn, :edit, spot))

      assert show_live
             |> form("#spot-form", spot: @invalid_attrs)
             |> render_change() =~ "can&apos;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#spot-form", spot: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.spot_show_path(conn, :show, spot))

      assert html =~ "Spot updated successfully"
      assert html =~ "some updated label"
    end
  end
end
