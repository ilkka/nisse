defmodule NisseWeb.PlantLiveTest do
  use NisseWeb.ConnCase

  import Phoenix.LiveViewTest

  alias Nisse.Plants

  @create_attrs %{acquired_on: %{year: "2010", month: "4", day: "17"}, name: "some name"}
  @update_attrs %{acquired_on: %{year: "2011", month: "5", day: "18"}, name: "some updated name"}
  @invalid_attrs %{name: nil}

  defp fixture(:plant) do
    {:ok, plant} = Plants.create_plant(@create_attrs)
    plant
  end

  defp create_plant(_) do
    plant = fixture(:plant)
    %{plant: plant}
  end

  describe "Index" do
    setup [:create_plant]

    test "lists all plants", %{conn: conn, plant: plant} do
      {:ok, _index_live, html} = live(conn, Routes.plant_index_path(conn, :index))

      assert html =~ "Listing Plants"
      assert html =~ plant.name
    end

    test "saves new plant", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.plant_index_path(conn, :index))

      assert index_live |> element("a", "New Plant") |> render_click() =~
               "New Plant"

      assert_patch(index_live, Routes.plant_index_path(conn, :new))

      assert index_live
             |> form("#plant-form", plant: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#plant-form", plant: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.plant_index_path(conn, :index))

      assert html =~ "Plant created successfully"
      assert html =~ "some name"
    end

    test "updates plant in listing", %{conn: conn, plant: plant} do
      {:ok, index_live, _html} = live(conn, Routes.plant_index_path(conn, :index))

      assert index_live |> element("#plant-#{plant.id} a", "Edit") |> render_click() =~
               "Edit Plant"

      assert_patch(index_live, Routes.plant_index_path(conn, :edit, plant))

      assert index_live
             |> form("#plant-form", plant: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#plant-form", plant: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.plant_index_path(conn, :index))

      assert html =~ "Plant updated successfully"
      assert html =~ "some updated name"
    end

    test "deletes plant in listing", %{conn: conn, plant: plant} do
      {:ok, index_live, _html} = live(conn, Routes.plant_index_path(conn, :index))

      assert index_live |> element("#plant-#{plant.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#plant-#{plant.id}")
    end
  end

  describe "Show" do
    setup [:create_plant]

    test "displays plant", %{conn: conn, plant: plant} do
      {:ok, _show_live, html} = live(conn, Routes.plant_show_path(conn, :show, plant))

      assert html =~ "Show Plant"
      assert html =~ plant.name
    end

    test "updates plant within modal", %{conn: conn, plant: plant} do
      {:ok, show_live, _html} = live(conn, Routes.plant_show_path(conn, :show, plant))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Plant"

      assert_patch(show_live, Routes.plant_show_path(conn, :edit, plant))

      assert show_live
             |> form("#plant-form", plant: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#plant-form", plant: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.plant_show_path(conn, :show, plant))

      assert html =~ "Plant updated successfully"
      assert html =~ "some updated name"
    end
  end
end
