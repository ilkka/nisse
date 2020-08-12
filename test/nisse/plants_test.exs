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
      plants_from_db = Plants.list_plants()

      assert Enum.all?(plants_from_db, fn a ->
               Enum.any?([plant], fn b -> a.id == b.id && a.name == b.name end)
             end)
    end

    test "get_plant!/1 returns the plant with given id" do
      plant = plant_fixture()
      plant_from_db = Plants.get_plant!(plant.id)
      assert plant_from_db.id == plant.id
      assert plant_from_db.name == plant.name
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

    @valid_attrs %{
      care_instructions: "some care_instructions",
      common_name: "some common_name",
      name: "some name"
    }
    @update_attrs %{
      care_instructions: "some updated care_instructions",
      common_name: "some updated common_name",
      name: "some updated name"
    }
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

      assert {:ok, %PlantSpecies{} = plant_species} =
               Plants.update_plant_species(plant_species, @update_attrs)

      assert plant_species.care_instructions == "some updated care_instructions"
      assert plant_species.common_name == "some updated common_name"
      assert plant_species.name == "some updated name"
    end

    test "update_plant_species/2 with invalid data returns error changeset" do
      plant_species = plant_species_fixture()

      assert {:error, %Ecto.Changeset{}} =
               Plants.update_plant_species(plant_species, @invalid_attrs)
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
      rooms_from_db = Plants.list_rooms()

      assert Enum.all?(rooms_from_db, fn a ->
               Enum.any?([room], fn b -> a.id == b.id && a.label == b.label end)
             end)
    end

    test "get_room!/1 returns the room with given id" do
      room = room_fixture()
      room_from_db = Plants.get_room!(room.id)
      assert room_from_db.id == room.id
      assert room_from_db.label == room.label
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

    test "room_has_plants?/1 returns true if and only if the room has plants" do
      {:ok, room} = Plants.create_room(%{label: "test room"})
      {:ok, spot} = Plants.create_spot(%{label: "test spot", room_id: room.id})
      refute Plants.room_has_plants?(room), "No plants if associations not loaded"

      room = Plants.get_room!(room.id)
      refute Plants.room_has_plants?(room), "No plants before adding plants"

      {:ok, _plant} =
        Plants.create_plant(%{acquired_on: ~D[2010-04-17], name: "some name", spot_id: spot.id})

      room = Plants.get_room!(room.id)
      assert Plants.room_has_plants?(room), "Has plants after adding plants"
    end
  end

  describe "spots" do
    alias Nisse.Plants.Spot

    @valid_attrs %{label: "some label"}
    @update_attrs %{label: "some updated label"}
    @invalid_attrs %{label: nil}

    def spot_fixture(attrs \\ %{}) do
      room = room_fixture()

      {:ok, spot} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Enum.into(%{room_id: room.id})
        |> Plants.create_spot()

      spot
    end

    test "list_spots/0 returns all spots" do
      spot = spot_fixture()
      spots_from_db = Plants.list_spots()

      assert Enum.all?(spots_from_db, fn s ->
               Enum.any?([spot], fn t -> s.id == t.id && s.label == t.label end)
             end)
    end

    test "get_spot!/1 returns the spot with given id" do
      spot = spot_fixture()
      spot_from_db = Plants.get_spot!(spot.id)
      assert spot_from_db.id == spot.id
      assert spot_from_db.label == spot.label
    end

    test "create_spot/1 with valid data creates a spot" do
      room = room_fixture()

      assert {:ok, %Spot{} = spot} =
               Plants.create_spot(Enum.into(@valid_attrs, %{room_id: room.id}))

      assert spot.label == "some label"
    end

    test "create_spot/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Plants.create_spot(@invalid_attrs)
      room = room_fixture()

      assert {:error, %Ecto.Changeset{}} =
               Plants.create_spot(Enum.into(@invalid_attrs, %{room_id: room.id}))
    end

    test "update_spot/2 with valid data updates the spot" do
      spot = spot_fixture()
      assert {:ok, %Spot{} = spot} = Plants.update_spot(spot, @update_attrs)
      assert spot.label == "some updated label"
    end

    test "update_spot/2 with invalid data returns error changeset" do
      spot = spot_fixture()
      assert {:error, %Ecto.Changeset{}} = Plants.update_spot(spot, @invalid_attrs)
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

  describe "plant_events" do
    alias Nisse.Plants.PlantEvent

    def plant_event_fixture() do
      plant = plant_fixture()

      {:ok, plant_event} = Plants.create_plant_event(:observation, plant.id, "some note")

      plant_event
    end

    test "list_plant_events/0 returns all plant_events" do
      plant_event = plant_event_fixture()
      assert Plants.list_plant_events() == [plant_event]
    end

    test "get_plant_event!/1 returns the plant_event with given id" do
      plant_event = plant_event_fixture()
      assert Plants.get_plant_event!(plant_event.id) == plant_event
    end

    test "create_plant_event/3 creates plant events with a note" do
      plant = plant_fixture()
      assert {:ok, %PlantEvent{}} = Plants.create_plant_event(:observation, plant.id, "a note")
    end

    test "create_plant_event/2 creates plant events without a note" do
      plant = plant_fixture()
      assert {:ok, %PlantEvent{}} = Plants.create_plant_event(:observation, plant.id)
    end

    test "last_watered/1 gives the timestamp of the last water event" do
      plant = plant_fixture()
      assert nil == Plants.last_watered(plant.id)

      assert {:ok, %PlantEvent{} = plant_event} =
               Plants.create_plant_event(:water, plant.id, "This is my note")

      assert plant_event.inserted_at == Plants.last_watered(plant.id)
    end
  end
end
