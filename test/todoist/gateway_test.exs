defmodule Todoist.GatewayTest do
  use ExUnit.Case
  import Mock

  alias Todoist.Gateway

  doctest Todoist.Project

  @resource "projects"

  @entity %{"id" => 1_777_363_729, "name" => "test"}

  describe "create a new resource on todoist" do
    test "when try to create a valid resource" do
      with_mock HttpHelper,
        create: fn @resource, _ -> {:ok, %Tesla.Env{body: @entity}} end do
        {:ok, _, message} = Gateway.create(@resource, @entity)
        assert "#{@resource} successfully created" = message
      end
    end

    test "when try to create a invalid resource" do
      with_mock HttpHelper,
        create: fn @resource, _ -> {:error, %Tesla.Env{body: "Error to create a resource"}} end do
        {:error, _, message} = Gateway.create(@resource, @entity)
        assert "error to create #{@resource}" == message
      end
    end
  end

  describe "get all resource" do
    test "when has a resource registered" do
      with_mock HttpHelper,
        find: fn @resource -> {:ok, %Tesla.Env{body: [@entity]}} end do
        {:ok, result} = Gateway.all(@resource)
        assert length(result) == 1
        assert List.first(result)["name"] == @entity["name"]
      end
    end

    test "error to get all resource" do
      with_mock HttpHelper,
        find: fn @resource ->
          {:error, %Tesla.Env{body: []}}
        end do
        {:error, [], message} = Gateway.all(@resource)
        assert "error to list #{@resource}" = message
      end
    end
  end

  describe "find one resource" do
    test "when has a resource registred" do
      with_mock HttpHelper,
        find: fn _ ->
          {:ok, %Tesla.Env{body: @entity}}
        end do
        {:ok, result} = Gateway.get_by_id(@resource, @entity["id"])
        assert result["name"] == @entity["name"]
      end
    end

    test "when not has a resource registred" do
      with_mock HttpHelper,
        find: fn _ -> {:error, %Tesla.Env{body: nil}} end do
        {:error, _, message} = Gateway.get_by_id(@resource, @entity["id"])
        assert "#{@resource} not found" = message
      end
    end
  end

  describe "delete todoist resource" do
    test "when has a resource registred" do
      with_mock HttpHelper,
        exclude: fn _ ->
          {:ok, %Tesla.Env{body: "resource deleted"}}
        end do
        {:ok, message} = Gateway.delete(@resource, @entity["id"])
        assert "#{@resource} deleted" == message
      end
    end

    test "when not has a resource registred" do
      with_mock HttpHelper,
        exclude: fn _ ->
          {:error, %Tesla.Env{body: nil}}
        end do
        {:error, message} = Gateway.delete(@resource, @entity["id"])
        assert "error to delete #{@resource} by id #{@entity["id"]}" == message
      end
    end
  end

  describe "update resource" do
    test "when resource is registred" do
      with_mock HttpHelper,
        update: fn _, _ ->
          {:ok, %Tesla.Env{body: @entity}}
        end do
        {:ok, _, message} = Gateway.update(@resource, @entity["id"], @entity)
        assert ^message = "updated #{@resource} id => #{@entity["id"]}"
      end
    end

    test "when resource is not found" do
      with_mock HttpHelper,
        update: fn _, _ ->
          {:error, %Tesla.Env{body: nil}}
        end do
        {:error, _, message} = Gateway.update(@resource, @entity["id"], @entity)
        assert ^message = "error to update #{@resource} with id #{@entity["id"]}"
      end
    end
  end
end
