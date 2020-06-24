defmodule Todoist.Project do
  @resource "projects"

  alias Todoist.Gateway

  def all(), do: Gateway.all(@resource)

  def get_by_id(id), do: Gateway.get_by_id(@resource, id)

  def delete(id), do: Gateway.delete(@resource, id)

  def create(project), do: Gateway.create(@resource, project)

  def update(id, project), do: Gateway.update(@resource, id, project)
end
