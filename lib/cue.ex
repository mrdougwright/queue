defmodule Cue do
  @moduledoc """
  Cue is a wrapper around Erlang :queue
  """
  use Agent

  @doc """
  Creates a new First In, First Out queue using Erlang's :queue

  ## Examples
      {:ok, pid} = Cue.new(:my_queue)
  """
  def new(name) do
    Agent.start_link(fn -> {[], []} end, name: name)
  end

  @doc """
  Adds an item to the queue.

  ## Examples
      iex> Cue.new(:my_queue)
      iex> Cue.push(:my_queue, 1)
      :ok
  """
  def push(name, item) do
    Agent.update(name, &:queue.in(item, &1))
  end

  @doc """
  Pops the oldest item off of the queue.

  ## Examples
      iex> Cue.new(:my_queue)
      iex> Cue.push(:my_queue, 1)
      iex> Cue.push(:my_queue, 2)
      iex> Cue.pop(:my_queue)
      1
  """
  def pop(name) do
    Agent.get_and_update(name, fn queue ->
      queue
      |> :queue.out()
      |> queue_out()
    end)
  end

  @doc """
  Displays the queue as a list, with oldest item last.

  ## Examples
      iex> Cue.new(:my_queue)
      iex> Cue.push(:my_queue, 1)
      iex> Cue.push(:my_queue, 2)
      iex> Cue.queue(:my_queue)
      [2,1]
  """
  def queue(name) do
    Agent.get(name, fn queue ->
      [a, b] = Tuple.to_list(queue)
      a ++ b
    end)
  end

  @doc """
  Removes the queue from memory, killing its process.
  """
  def delete(name), do: Agent.stop(name, :normal)

  defp queue_out({{:value, value}, queue}), do: {value, queue}
  defp queue_out({:empty, queue}), do: {nil, queue}
end
