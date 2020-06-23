import Config

config :logger,
  backends: [:console],
  compile_time_purge_matching: [
    [level_lower_than: :info]
  ]

config :ex_todoist,
  base_url: System.get_env("TODOIST_URL", "https://api.todoist.com/rest/v1/"),
  token: System.get_env("TODOIST_TOKEN")

config :tesla, adapter: Tesla.Adapter.Hackney
