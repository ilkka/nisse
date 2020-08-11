defmodule Nisse.Plants do
  @moduledoc """
  The Plants context.
  """

  import Ecto.Query, warn: false
  alias Nisse.Repo

  alias Nisse.Plants.Plant

  @doc """
  Returns the list of plants.

  ## Examples

      iex> list_plants()
      [%Plant{}, ...]

  """
  def list_plants do
    Repo.all(Plant) |> Repo.preload([:species, spot: [:room]])
  end

  @doc """
  Gets a single plant.

  Raises `Ecto.NoResultsError` if the Plant does not exist.

  ## Examples

      iex> get_plant!(123)
      %Plant{}

      iex> get_plant!(456)
      ** (Ecto.NoResultsError)

  """
  def get_plant!(id), do: Repo.get!(Plant, id) |> Repo.preload([:species, spot: [:room]])

  @doc """
  Creates a plant.

  ## Examples

      iex> create_plant(%{field: value})
      {:ok, %Plant{}}

      iex> create_plant(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_plant(attrs \\ %{}) do
    %Plant{}
    |> Plant.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a plant.

  ## Examples

      iex> update_plant(plant, %{field: new_value})
      {:ok, %Plant{}}

      iex> update_plant(plant, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_plant(%Plant{} = plant, attrs) do
    plant
    |> Plant.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a plant.

  ## Examples

      iex> delete_plant(plant)
      {:ok, %Plant{}}

      iex> delete_plant(plant)
      {:error, %Ecto.Changeset{}}

  """
  def delete_plant(%Plant{} = plant) do
    Repo.delete(plant)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking plant changes.

  ## Examples

      iex> change_plant(plant)
      %Ecto.Changeset{data: %Plant{}}

  """
  def change_plant(%Plant{} = plant, attrs \\ %{}) do
    Plant.changeset(plant, attrs)
  end

  alias Nisse.Plants.PlantSpecies

  @doc """
  Returns the list of plant_species.

  ## Examples

      iex> list_plant_species()
      [%PlantSpecies{}, ...]

  """
  def list_plant_species do
    Repo.all(PlantSpecies)
  end

  @doc """
  Gets a single plant_species.

  Raises `Ecto.NoResultsError` if the Plant species does not exist.

  ## Examples

      iex> get_plant_species!(123)
      %PlantSpecies{}

      iex> get_plant_species!(456)
      ** (Ecto.NoResultsError)

  """
  def get_plant_species!(id), do: Repo.get!(PlantSpecies, id)

  @doc """
  Creates a plant_species.

  ## Examples

      iex> create_plant_species(%{field: value})
      {:ok, %PlantSpecies{}}

      iex> create_plant_species(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_plant_species(attrs \\ %{}) do
    %PlantSpecies{}
    |> PlantSpecies.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a plant_species.

  ## Examples

      iex> update_plant_species(plant_species, %{field: new_value})
      {:ok, %PlantSpecies{}}

      iex> update_plant_species(plant_species, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_plant_species(%PlantSpecies{} = plant_species, attrs) do
    plant_species
    |> PlantSpecies.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a plant_species.

  ## Examples

      iex> delete_plant_species(plant_species)
      {:ok, %PlantSpecies{}}

      iex> delete_plant_species(plant_species)
      {:error, %Ecto.Changeset{}}

  """
  def delete_plant_species(%PlantSpecies{} = plant_species) do
    Repo.delete(plant_species)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking plant_species changes.

  ## Examples

      iex> change_plant_species(plant_species)
      %Ecto.Changeset{data: %PlantSpecies{}}

  """
  def change_plant_species(%PlantSpecies{} = plant_species, attrs \\ %{}) do
    PlantSpecies.changeset(plant_species, attrs)
  end

  alias Nisse.Plants.Spot

  @doc """
  Returns the list of spots.

  ## Examples

      iex> list_spots()
      [%Spot{}, ...]

  """
  def list_spots do
    Repo.all(Spot) |> Repo.preload([:room, plants: [:species]])
  end

  @doc """
  Gets a single spot.

  Raises `Ecto.NoResultsError` if the Spot does not exist.

  ## Examples

      iex> get_spot!(123)
      %Spot{}

      iex> get_spot!(456)
      ** (Ecto.NoResultsError)

  """
  def get_spot!(id), do: Repo.get!(Spot, id) |> Repo.preload([:room, plants: [:species]])

  @doc """
  Creates a spot.

  ## Examples

      iex> create_spot(%{field: value})
      {:ok, %Spot{}}

      iex> create_spot(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_spot(attrs \\ %{}) do
    %Spot{}
    |> Spot.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a spot.

  ## Examples

      iex> update_spot(spot, %{field: new_value})
      {:ok, %Spot{}}

      iex> update_spot(spot, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_spot(%Spot{} = spot, attrs) do
    spot
    |> Spot.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a spot.

  ## Examples

      iex> delete_spot(spot)
      {:ok, %Spot{}}

      iex> delete_spot(spot)
      {:error, %Ecto.Changeset{}}

  """
  def delete_spot(%Spot{} = spot) do
    Repo.delete(spot)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking spot changes.

  ## Examples

      iex> change_spot(spot)
      %Ecto.Changeset{data: %Spot{}}

  """
  def change_spot(%Spot{} = spot, attrs \\ %{}) do
    Spot.changeset(spot, attrs)
  end

  alias Nisse.Plants.Room

  @doc """
  Returns the list of rooms.

  ## Examples

      iex> list_rooms()
      [%Room{}, ...]

  """
  def list_rooms do
    Repo.all(Room) |> Repo.preload(spots: [plants: [:species]])
  end

  @doc """
  Gets a single room.

  Raises `Ecto.NoResultsError` if the Room does not exist.

  ## Examples

      iex> get_room!(123)
      %Room{}

      iex> get_room!(456)
      ** (Ecto.NoResultsError)

  """
  def get_room!(id), do: Repo.get!(Room, id) |> Repo.preload(spots: [plants: [:species]])

  @doc """
  Creates a room.

  ## Examples

      iex> create_room(%{field: value})
      {:ok, %Room{}}

      iex> create_room(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_room(attrs \\ %{}) do
    %Room{}
    |> Room.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a room.

  ## Examples

      iex> update_room(room, %{field: new_value})
      {:ok, %Room{}}

      iex> update_room(room, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_room(%Room{} = room, attrs) do
    room
    |> Room.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a room.

  ## Examples

      iex> delete_room(room)
      {:ok, %Room{}}

      iex> delete_room(room)
      {:error, %Ecto.Changeset{}}

  """
  def delete_room(%Room{} = room) do
    Repo.delete(room)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking room changes.

  ## Examples

      iex> change_room(room)
      %Ecto.Changeset{data: %Room{}}

  """
  def change_room(%Room{} = room, attrs \\ %{}) do
    Room.changeset(room, attrs)
  end

  @doc """
  Check if a room has plants in it
  """
  def room_has_plants?(%Room{} = room) do
    room
    |> Repo.preload(spots: [:plants])
    |> Map.get(:spots)
    |> Enum.any?(fn spot -> !Enum.empty?(spot.plants) end)
  end

  @doc """
  Get available spot light direction values.
  """
  def light_directions() do
    Repo.query!("SELECT enum_range(NULL::light_direction)").rows |> Enum.at(0) |> Enum.at(0)
  end

  @doc """
  Get available spot light level values.
  """
  def light_levels() do
    Repo.query!("SELECT enum_range(NULL::light_level)").rows |> Enum.at(0) |> Enum.at(0)
  end

  @doc """
  Get available spot temperature values.
  """
  def temperatures() do
    Repo.query!("SELECT enum_range(NULL::temperature)").rows |> Enum.at(0) |> Enum.at(0)
  end

  alias Nisse.Plants.PlantEvent

  @doc """
  Returns the list of plant_events.

  ## Examples

      iex> list_plant_events()
      [%PlantEvent{}, ...]

  """
  def list_plant_events do
    Repo.all(PlantEvent)
  end

  @doc """
  Gets a single plant_event.

  Raises `Ecto.NoResultsError` if the Plant event does not exist.

  ## Examples

      iex> get_plant_event!(123)
      %PlantEvent{}

      iex> get_plant_event!(456)
      ** (Ecto.NoResultsError)

  """
  def get_plant_event!(id), do: Repo.get!(PlantEvent, id)

  @doc """
  Creates a plant_event.

  ## Examples

      iex> create_plant_event(%{field: value})
      {:ok, %PlantEvent{}}

      iex> create_plant_event(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_plant_event(attrs \\ %{}) do
    %PlantEvent{}
    |> PlantEvent.changeset(attrs)
    |> Repo.insert()
  end
end
