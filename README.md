# Todoist

[![Circle CI](https://circleci.com/gh/l3co-Elixir/ex_todoist/tree/master.svg?style=shield&circle-token=5ccd4f798d6114b7e742f44d8a7ecb765cb46292)](https://circleci.com/gh/l3co-Elixir/ex_todoist/tree/master)


This project is a wrapper to Todoist API.

* https://developer.todoist.com/rest/v1/

### Support

- [X] Projects
- [] Tasks
- [] Labels
- [] Colors

## Environments variables

```bash
export TODOIST_TOKEN=""
export TODOIST_URL=""
```

> Obs.: By default TODOIST_URL is seted as https://developer.todoist.com/rest/v1/

## How to run todoist tests

```bash
mix test
```

## How to use this library 

> First you need to export your environments variables 

```bash
iex > project = %Todoist.Projects.Project{name: "test"}
iex > Todoist.Projects.ProjectService.create(project)
```

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `todoist` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:todoist, "~> 1.0.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/todoist](https://hexdocs.pm/todoist).

