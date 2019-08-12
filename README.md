# Queue

This is a simple wrapper around Erlang's :queue module. Unlike other wrappers, this provides a simple interface for dealing with First In, First Out [FIFO](https://en.wikipedia.org/wiki/Queue_(abstract_data_type)) queues.

# Examples
```elixir
Queue.new(:q)
=> {:ok, pid}

Queue.push(:q, 1)
Queue.push(:q, 2)
Queue.push(:q, ["a", "b"])
Queue.push(:q, 3)
=> :ok

Queue.pop(:q)
=> 1

Queue.queue(:q)
=> [3, ["a", "b"], 2]

Queue.delete(:q)
:ok
```

Docs can be found at [https://hexdocs.pm/queue](https://hexdocs.pm/queue).

## Installation

Available as [Hex package](https://hex.pm/docs/publish) (aka an Elixir Drop), the package can be installed by adding `queue` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:queue, "~> 0.1.0"}
  ]
end
```

## Contributing
Ideas or improvements? Please submit a Github issue.
To submit a PR, please fork this repo first.
