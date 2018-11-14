defmodule LearnExunit do
  @moduledoc """
  Documentation for LearnExunit.
  """

  def to_atom(string) when is_bitstring(string) do
    String.to_atom(string)
  end

  def to_atom(atom) when is_atom(atom) do
    atom
  end

  def to_atom(integer) when is_integer(integer) do
    integer
    |> Integer.to_string()
    |> to_atom()
  end

  def to_to_atom(term: term) do
    to_atom(term)
  end

  # __end_of_module__
end
