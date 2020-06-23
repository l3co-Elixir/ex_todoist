defmodule Todoist.Projects.ProjectService do
  @resource "projects"

  alias HttpHelper, as: Http
  alias Todoist.Projects.Project

  def all() do
    case Http.find(@resource) do
      {:ok, response} ->
        response.body
        |> Enum.map(&Project.parse/1)
    end
  end

  def get_by_id(id) do
    case Http.find("#{@resource}/#{id}") do
      {:ok, response} ->
        response.body
        |> Project.parse()

      {:error, _} ->
        "Project not found"
    end
  end

  def create(project) do
    case Http.create(@resource, project) do
      {:ok, response} ->
        {:ok, "Create a new project with name #{project.name}, your ID is #{response.body["id"]}"}

      {:error, _} ->
        {:error, "Error to create project with name #{project.name}"}
    end
  end

  def update(id, project) do
    case Http.update("#{@resource}/#{id}", project) do
      {:ok, _} -> {:ok, "Updated project id => #{id}"}
      {:error, _} -> {:error, "Error to update project with id #{id}"}
    end
  end
end
