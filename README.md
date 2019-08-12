# Cue

This is a simple wrapper around Erlang's :queue module. Unlike other wrappers, this provides a simple interface for dealing with First In, First Out [FIFO](https://en.wikipedia.org/wiki/Queue_(abstract_data_type)) queues.

# Examples
```elixir
Cue.new(:q)
=> {:ok, pid}

Cue.push(:q, 1)
Cue.push(:q, 2)
Cue.push(:q, ["a", "b"])
Cue.push(:q, 3)
=> :ok

Cue.pop(:q)
=> 1

Cue.queue(:q)
=> [3, ["a", "b"], 2]

Cue.delete(:q)
:ok
```

Docs can be found at [https://hexdocs.pm/cue](https://hexdocs.pm/cue).

## Installation

Available as [Hex package](https://hex.pm/docs/publish) (aka an Elixir Drop), the package can be installed by adding `cue` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:cue, "~> 0.1.0"}
  ]
end
```

## Contributing
Ideas or improvements? Please submit a Github issue.
To submit a PR, please fork this repo first.
