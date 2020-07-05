defmodule NisseWeb.PlantSpeciesLiveTest do
  use NisseWeb.ConnCase

  import Phoenix.LiveViewTest

  alias Nisse.Plants

  @create_attrs %{care_instructions: "some care_instructions", common_name: "some common_name", name: "some name"}
  @update_attrs %{care_instructions: "some updated care_instructions", common_name: "some updated common_name", name: "some updated name"}
  @invalid_attrs %{care_instructions: nil, common_name: nil, name: nil}

  defp fixture(:plant_species) do
    {:ok, plant_species} = Plants.create_plant_species(@create_attrs)
    plant_species
  end

  defp create_plant_species(_) do
    plant_species = fixture(:plant_species)
    %{plant_species: plant_species}
  end

  describe "Index" do
    setup [:create_plant_species]

    test "lists all plant_species", %{conn: conn, plant_species: plant_species} do
      {:ok, _index_live, html} = live(conn, Routes.plant_species_index_path(conn, :index))

      assert html =~ "Listing Plant species"
      assert html =~ plant_species.care_instructions
    end

    test "saves new plant_species", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.plant_species_index_path(conn, :index))

      assert index_live |> element("a", "New Plant species") |> render_click() =~
               "New Plant species"

      assert_patch(index_live, Routes.plant_species_index_path(conn, :new))

      assert index_live
             |> form("#plant_species-form", plant_species: @invalid_attrs)
             |> render_change() =~ "can&apos;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#plant_species-form", plant_species: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.plant_species_index_path(conn, :index))

      assert html =~ "Plant species created successfully"
      assert html =~ "some care_instructions"
    end

    test "updates plant_species in listing", %{conn: conn, plant_species: plant_species} do
      {:ok, index_live, _html} = live(conn, Routes.plant_species_index_path(conn, :index))

      assert index_live |> element("#plant_species-#{plant_species.id} a", "Edit") |> render_click() =~
               "Edit Plant species"

      assert_patch(index_live, Routes.plant_species_index_path(conn, :edit, plant_species))

      assert index_live
             |> form("#plant_species-form", plant_species: @invalid_attrs)
             |> render_change() =~ "can&apos;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#plant_species-form", plant_species: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.plant_species_index_path(conn, :index))

      assert html =~ "Plant species updated successfully"
      assert html =~ "some updated care_instructions"
    end

    test "deletes plant_species in listing", %{conn: conn, plant_species: plant_species} do
      {:ok, index_live, _html} = live(conn, Routes.plant_species_index_path(conn, :index))

      assert index_live |> element("#plant_species-#{plant_species.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#plant_species-#{plant_species.id}")
    end
  end

  describe "Show" do
    setup [:create_plant_species]

    test "displays plant_species", %{conn: conn, plant_species: plant_species} do
      {:ok, _show_live, html} = live(conn, Routes.plant_species_show_path(conn, :show, plant_species))

      assert html =~ "Show Plant species"
      assert html =~ plant_species.care_instructions
    end

    test "updates plant_species within modal", %{conn: conn, plant_species: plant_species} do
      {:ok, show_live, _html} = live(conn, Routes.plant_species_show_path(conn, :show, plant_species))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Plant species"

      assert_patch(show_live, Routes.plant_species_show_path(conn, :edit, plant_species))

      assert show_live
             |> form("#plant_species-form", plant_species: @invalid_attrs)
             |> render_change() =~ "can&apos;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#plant_species-form", plant_species: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.plant_species_show_path(conn, :show, plant_species))

      assert html =~ "Plant species updated successfully"
      assert html =~ "some updated care_instructions"
    end
  end
end
