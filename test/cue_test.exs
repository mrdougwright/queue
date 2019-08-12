defmodule CueTest do
  use ExUnit.Case
  doctest Cue

  setup do
    Cue.new(:my_q)
    Cue.push(:my_q, 1)
    Cue.push(:my_q, 2)
    :ok
  end

  test "new/1 creates empty queue" do
    Cue.new(:new_q)
    assert Cue.queue(:new_q) == []
  end

  test "push/2 adds item to queue" do
    Cue.push(:my_q, 3)
    assert Cue.queue(:my_q) == [3,2,1]
  end

  test "pop/1 removes last item from queue" do
    assert Cue.pop(:my_q) == 1
  end

  test "queue/1 displays current queue as list" do
    assert Cue.queue(:my_q) == [2,1]
  end

  test "delete/1 removes the queue from memory" do
    :ok = Cue.delete(:my_q)
    assert Process.whereis(:my_q) == nil
  end
end
