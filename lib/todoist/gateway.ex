defmodule Todoist.Gateway do
  alias HttpHelper, as: Http

  @moduledoc """
  Todoist.Gateway is a generic module that encapsulates principal methods to
  create, update delete and list all or a specific resource.

  * Resource can be a task, projects, labels, sections, comments and colors

  * This module is used by Task, Project, Comments and Labels, if you want
  create some resource don't use this module.

  Obs.: This method need one environment variable TODOIST_TOKEN
  """

  @doc """
  `all` list all resource
  """
  def all(resource) do
    case Http.find(resource) do
      {:ok, response} -> {:ok, response.body}
      {:error, _} -> {:error, [], "error to list #{resource}"}
    end
  end

  @doc """
  `get_by_id` return a specific resource by id
  """
  def get_by_id(resource, id) do
    case Http.find("#{resource}/#{id}") do
      {:ok, response} -> {:ok, response.body}
      {:error, _} -> {:error, %{}, "#{resource} not found"}
    end
  end

  @doc """
  `delete` delete a specific resource by id
  """
  @spec delete(any, any) :: {:error, <<_::64, _::_*8>>} | {:ok, <<_::128>>}
  def delete(resource, id) do
    case Http.exclude("#{resource}/#{id}") do
      {:ok, _} -> {:ok, "#{resource} deleted"}
      {:error, _} -> {:error, "error to delete #{resource} by id #{id}"}
    end
  end

  @doc """
  `create` add a new resource on todoist api
  """
  def create(resource, entity) do
    case Http.create(resource, entity) do
      {:ok, response} ->
        {:ok, response.body, "#{resource} successfully created"}

      {:error, response} ->
        {:error, response.body, "error to create #{resource}"}
    end
  end

  @doc """
  `update` update a specific resource
  """
  def update(resource, id, entity) do
    case Http.update("#{resource}/#{id}", entity) do
      {:ok, response} -> {:ok, response.body, "updated #{resource} id => #{id}"}
      {:error, _} -> {:error, %{}, "error to update #{resource} with id #{id}"}
    end
  end
end
