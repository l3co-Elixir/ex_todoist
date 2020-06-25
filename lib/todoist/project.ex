defmodule Todoist.Project do
  @resource "projects"

  alias Todoist.Gateway

  @moduledoc """
  Todoist.Project is a module used to create and manipulate your projects.
  """

  @doc """
  all show all projects
  """
  def all(), do: Gateway.all(@resource)

  @doc """
  get_by_id find a project by id
  """
  def get_by_id(id), do: Gateway.get_by_id(@resource, id)

  @doc """
  delete remove a project by id
  """
  def delete(id), do: Gateway.delete(@resource, id)

  @doc """
  create a new project
  """
  def create(project), do: Gateway.create(@resource, project)

  @doc """
  update a project
  """
  def update(id, project), do: Gateway.update(@resource, id, project)
end
