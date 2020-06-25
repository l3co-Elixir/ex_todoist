defmodule Todoist.Task do
  @resource "tasks"

  @moduledoc """
  Todoist.Project is a module used to create and manipulate your tasks.
  """

  alias Todoist.Gateway

  @doc """
  all show all tasks
  """
  def all(), do: Gateway.all(@resource)

  @doc """
  get_by_id find a tasks by id
  """
  def get_by_id(id), do: Gateway.get_by_id(@resource, id)

  @doc """
  delete remove a tasks by id
  """
  def delete(id), do: Gateway.delete(@resource, id)

  @doc """
  create a new task
  """
  def create(task), do: Gateway.create(@resource, task)

  @doc """
  update a task
  """
  def update(id, task), do: Gateway.update(@resource, id, task)
end
