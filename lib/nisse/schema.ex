defmodule Nisse.Schema do
  defmacro __using__(_) do
    quote do
      use Ecto.Schema
      @timestamp_opts [type: :utc_datetime]
    end
  end
end
