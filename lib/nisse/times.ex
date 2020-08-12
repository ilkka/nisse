defmodule Nisse.Times do
  def format_relative!(time) do
    Timex.format!(time, "{relative}", :relative)
  end
end
