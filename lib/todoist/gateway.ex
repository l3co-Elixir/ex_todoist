defmodule Todoist.Gateway do
  alias HttpHelper, as: Http

  def all(resource) do
    case Http.find(resource) do
      {:ok, response} -> {:ok, response.body}
      {:error, _} -> {:error, [], "error to list #{resource}"}
    end
  end

  def get_by_id(resource, id) do
    case Http.find("#{resource}/#{id}") do
      {:ok, response} -> {:ok, response.body}
      {:error, _} -> {:error, %{}, "#{resource} not found"}
    end
  end

  @spec delete(any, any) :: {:error, <<_::64, _::_*8>>} | {:ok, <<_::128>>}
  def delete(resource, id) do
    case Http.exclude("#{resource}/#{id}") do
      {:ok, _} -> {:ok, "#{resource} deleted"}
      {:error, _} -> {:error, "error to delete #{resource} by id #{id}"}
    end
  end

  def create(resource, entity) do
    case Http.create(resource, entity) do
      {:ok, response} ->
        {:ok, response.body, "#{resource} successfully created"}

      {:error, response} ->
        {:error, response.body, "error to create #{resource}"}
    end
  end

  def update(resource, id, entity) do
    case Http.update("#{resource}/#{id}", entity) do
      {:ok, response} -> {:ok, response.body, "updated #{resource} id => #{id}"}
      {:error, _} -> {:error, %{}, "error to update #{resource} with id #{id}"}
    end
  end
end
