defmodule QueueTest do
  use ExUnit.Case
  doctest Queue

  setup do
    Queue.new(:my_q)
    Queue.push(:my_q, 1)
    Queue.push(:my_q, 2)
    :ok
  end

  test "new/1 creates empty queue" do
    Queue.new(:new_q)
    assert Queue.queue(:new_q) == []
  end

  test "push/2 adds item to queue" do
    Queue.push(:my_q, 3)
    assert Queue.queue(:my_q) == [3,2,1]
  end

  test "pop/1 removes last item from queue" do
    assert Queue.pop(:my_q) == 1
  end

  test "queue/1 displays current queue as list" do
    assert Queue.queue(:my_q) == [2,1]
  end

  test "delete/1 removes the queue from memory" do
    :ok = Queue.delete(:my_q)
    assert Process.whereis(:my_q) == nil
  end
end
