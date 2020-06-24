defmodule Todoist.Task do
  @resource "tasks"

  alias Todoist.Gateway

  def all(), do: Gateway.all(@resource)

  def get_by_id(id), do: Gateway.get_by_id(@resource, id)

  def delete(id), do: Gateway.delete(@resource, id)

  def create(task), do: Gateway.create(@resource, task)

  def update(id, task), do: Gateway.update(@resource, id, task)
end
