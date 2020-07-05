defmodule Nisse.PlantsTest do
  use Nisse.DataCase

  alias Nisse.Plants

  describe "plants" do
    alias Nisse.Plants.Plant

    @valid_attrs %{acquired_on: ~D[2010-04-17], name: "some name"}
    @update_attrs %{acquired_on: ~D[2011-05-18], name: "some updated name"}
    @invalid_attrs %{acquired_on: nil, name: nil}

    def plant_fixture(attrs \\ %{}) do
      {:ok, plant} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Plants.create_plant()

      plant
    end

    test "list_plants/0 returns all plants" do
      plant = plant_fixture()
      assert Plants.list_plants() == [plant]
    end

    test "get_plant!/1 returns the plant with given id" do
      plant = plant_fixture()
      assert Plants.get_plant!(plant.id) == plant
    end

    test "create_plant/1 with valid data creates a plant" do
      assert {:ok, %Plant{} = plant} = Plants.create_plant(@valid_attrs)
      assert plant.acquired_on == ~D[2010-04-17]
      assert plant.name == "some name"
    end

    test "create_plant/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Plants.create_plant(@invalid_attrs)
    end

    test "update_plant/2 with valid data updates the plant" do
      plant = plant_fixture()
      assert {:ok, %Plant{} = plant} = Plants.update_plant(plant, @update_attrs)
      assert plant.acquired_on == ~D[2011-05-18]
      assert plant.name == "some updated name"
    end

    test "update_plant/2 with invalid data returns error changeset" do
      plant = plant_fixture()
      assert {:error, %Ecto.Changeset{}} = Plants.update_plant(plant, @invalid_attrs)
      assert plant == Plants.get_plant!(plant.id)
    end

    test "delete_plant/1 deletes the plant" do
      plant = plant_fixture()
      assert {:ok, %Plant{}} = Plants.delete_plant(plant)
      assert_raise Ecto.NoResultsError, fn -> Plants.get_plant!(plant.id) end
    end

    test "change_plant/1 returns a plant changeset" do
      plant = plant_fixture()
      assert %Ecto.Changeset{} = Plants.change_plant(plant)
    end
  end

  describe "plant_species" do
    alias Nisse.Plants.PlantSpecies

    @valid_attrs %{care_instructions: "some care_instructions", common_name: "some common_name", name: "some name"}
    @update_attrs %{care_instructions: "some updated care_instructions", common_name: "some updated common_name", name: "some updated name"}
    @invalid_attrs %{care_instructions: nil, common_name: nil, name: nil}

    def plant_species_fixture(attrs \\ %{}) do
      {:ok, plant_species} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Plants.create_plant_species()

      plant_species
    end

    test "list_plant_species/0 returns all plant_species" do
      plant_species = plant_species_fixture()
      assert Plants.list_plant_species() == [plant_species]
    end

    test "get_plant_species!/1 returns the plant_species with given id" do
      plant_species = plant_species_fixture()
      assert Plants.get_plant_species!(plant_species.id) == plant_species
    end

    test "create_plant_species/1 with valid data creates a plant_species" do
      assert {:ok, %PlantSpecies{} = plant_species} = Plants.create_plant_species(@valid_attrs)
      assert plant_species.care_instructions == "some care_instructions"
      assert plant_species.common_name == "some common_name"
      assert plant_species.name == "some name"
    end

    test "create_plant_species/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Plants.create_plant_species(@invalid_attrs)
    end

    test "update_plant_species/2 with valid data updates the plant_species" do
      plant_species = plant_species_fixture()
      assert {:ok, %PlantSpecies{} = plant_species} = Plants.update_plant_species(plant_species, @update_attrs)
      assert plant_species.care_instructions == "some updated care_instructions"
      assert plant_species.common_name == "some updated common_name"
      assert plant_species.name == "some updated name"
    end

    test "update_plant_species/2 with invalid data returns error changeset" do
      plant_species = plant_species_fixture()
      assert {:error, %Ecto.Changeset{}} = Plants.update_plant_species(plant_species, @invalid_attrs)
      assert plant_species == Plants.get_plant_species!(plant_species.id)
    end

    test "delete_plant_species/1 deletes the plant_species" do
      plant_species = plant_species_fixture()
      assert {:ok, %PlantSpecies{}} = Plants.delete_plant_species(plant_species)
      assert_raise Ecto.NoResultsError, fn -> Plants.get_plant_species!(plant_species.id) end
    end

    test "change_plant_species/1 returns a plant_species changeset" do
      plant_species = plant_species_fixture()
      assert %Ecto.Changeset{} = Plants.change_plant_species(plant_species)
    end
  end

  describe "spots" do
    alias Nisse.Plants.Spot

    @valid_attrs %{label: "some label"}
    @update_attrs %{label: "some updated label"}
    @invalid_attrs %{label: nil}

    def spot_fixture(attrs \\ %{}) do
      {:ok, spot} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Plants.create_spot()

      spot
    end

    test "list_spots/0 returns all spots" do
      spot = spot_fixture()
      assert Plants.list_spots() == [spot]
    end

    test "get_spot!/1 returns the spot with given id" do
      spot = spot_fixture()
      assert Plants.get_spot!(spot.id) == spot
    end

    test "create_spot/1 with valid data creates a spot" do
      assert {:ok, %Spot{} = spot} = Plants.create_spot(@valid_attrs)
      assert spot.label == "some label"
    end

    test "create_spot/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Plants.create_spot(@invalid_attrs)
    end

    test "update_spot/2 with valid data updates the spot" do
      spot = spot_fixture()
      assert {:ok, %Spot{} = spot} = Plants.update_spot(spot, @update_attrs)
      assert spot.label == "some updated label"
    end

    test "update_spot/2 with invalid data returns error changeset" do
      spot = spot_fixture()
      assert {:error, %Ecto.Changeset{}} = Plants.update_spot(spot, @invalid_attrs)
      assert spot == Plants.get_spot!(spot.id)
    end

    test "delete_spot/1 deletes the spot" do
      spot = spot_fixture()
      assert {:ok, %Spot{}} = Plants.delete_spot(spot)
      assert_raise Ecto.NoResultsError, fn -> Plants.get_spot!(spot.id) end
    end

    test "change_spot/1 returns a spot changeset" do
      spot = spot_fixture()
      assert %Ecto.Changeset{} = Plants.change_spot(spot)
    end
  end

  describe "rooms" do
    alias Nisse.Plants.Room

    @valid_attrs %{label: "some label"}
    @update_attrs %{label: "some updated label"}
    @invalid_attrs %{label: nil}

    def room_fixture(attrs \\ %{}) do
      {:ok, room} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Plants.create_room()

      room
    end

    test "list_rooms/0 returns all rooms" do
      room = room_fixture()
      assert Plants.list_rooms() == [room]
    end

    test "get_room!/1 returns the room with given id" do
      room = room_fixture()
      assert Plants.get_room!(room.id) == room
    end

    test "create_room/1 with valid data creates a room" do
      assert {:ok, %Room{} = room} = Plants.create_room(@valid_attrs)
      assert room.label == "some label"
    end

    test "create_room/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Plants.create_room(@invalid_attrs)
    end

    test "update_room/2 with valid data updates the room" do
      room = room_fixture()
      assert {:ok, %Room{} = room} = Plants.update_room(room, @update_attrs)
      assert room.label == "some updated label"
    end

    test "update_room/2 with invalid data returns error changeset" do
      room = room_fixture()
      assert {:error, %Ecto.Changeset{}} = Plants.update_room(room, @invalid_attrs)
      assert room == Plants.get_room!(room.id)
    end

    test "delete_room/1 deletes the room" do
      room = room_fixture()
      assert {:ok, %Room{}} = Plants.delete_room(room)
      assert_raise Ecto.NoResultsError, fn -> Plants.get_room!(room.id) end
    end

    test "change_room/1 returns a room changeset" do
      room = room_fixture()
      assert %Ecto.Changeset{} = Plants.change_room(room)
    end
  end
end
