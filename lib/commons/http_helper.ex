defmodule HttpHelper do
  use Tesla

  plug(Tesla.Middleware.BaseUrl, Application.fetch_env!(:ex_todoist, :base_url))

  plug(Tesla.Middleware.Headers, [
    {
      "authorization",
      "Bearer #{Application.fetch_env!(:ex_todoist, :token)}"
    },
    {
      "X-Request-Id",
      UUID.uuid4()
    }
  ])

  plug(Tesla.Middleware.JSON)

  def find(resource) do
    get(resource)
  end

  def create(resource, data) do
    post(resource, data)
  end

  def update(resource, data) do
    put(resource, data)
  end
end
