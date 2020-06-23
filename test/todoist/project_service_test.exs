defmodule Todoist.Projects.ProjectServiceTest do
  use ExUnit.Case
  import Mock

  alias Todoist.Projects.ProjectService, as: Service
  alias Todoist.Projects.Project

  doctest Todoist.Projects.ProjectService

  @resource "projects"

  @project %{
    "color" => 48,
    "comment_count" => 0,
    "favorite" => false,
    "id" => 1_777_363_729,
    "inbox_project" => true,
    "name" => "test",
    "shared" => false,
    "sync_id" => 0
  }

  describe "create a new project on todoist" do
    test "when try to create a valid project" do
      project = %Project{name: "test", color: 35}

      with_mock HttpHelper,
        create: fn @resource, _ -> {:ok, %Tesla.Env{body: @project}} end do
        result = Service.create(project)

        assert ^result =
                 {:ok,
                  "Create a new project with name #{@project["name"]}, your ID is #{
                    @project["id"]
                  }"}
      end
    end

    test "when try to create an invalid project" do
      project = %Project{name: "test", color: 35}

      with_mock HttpHelper,
        create: fn @resource, _ -> {:error, "Error to create a project"} end do
        result = Service.create(project)
        assert ^result = {:error, "Error to create project with name #{project.name}"}
      end
    end
  end

  describe "get all projects" do
    test "when has a project registered" do
      with_mock HttpHelper,
        find: fn @resource ->
          {:ok,
           %Tesla.Env{
             body: [@project]
           }}
        end do
        result = Service.all()
        assert length(result) == 1
        assert List.first(result).name == @project["name"]
      end
    end

    test "when not has a project registred" do
      with_mock HttpHelper,
        find: fn @resource ->
          {:ok, %Tesla.Env{body: []}}
        end do
        result = Service.all()
        assert length(result) == 0
      end
    end
  end

  describe "find one project" do
    test "when has a project registred" do
      with_mock HttpHelper,
        find: fn _ ->
          {:ok, %Tesla.Env{body: @project}}
        end do
        result = Service.get_by_id(@project["id"])
        assert result.name == @project["name"]
      end
    end

    test "when not has a project registred" do
      with_mock HttpHelper,
        find: fn _ ->
          {:error, %Tesla.Env{body: nil}}
        end do
        result = Service.get_by_id(@project["id"])
        assert "Project not found" == result
      end
    end
  end

  describe "delete todoist project" do
    test "when has a project registred" do
      with_mock HttpHelper,
        exclude: fn _ ->
          {:ok, %Tesla.Env{body: "project deleted"}}
        end do
        result = Service.delete_project(@project["id"])
        assert {:ok, "Project deleted"} == result
      end
    end

    test "when not has a project registred" do
      with_mock HttpHelper,
        exclude: fn _ ->
          {:error, %Tesla.Env{body: nil}}
        end do
        result = Service.delete_project(@project["id"])
        assert {:error, "Error to delete project id #{@project["id"]}"} == result
      end
    end
  end

  describe "update project" do
    test "when project is registred" do
      with_mock HttpHelper,
        update: fn _, _ ->
          {:ok, %Tesla.Env{body: @project}}
        end do
        result = Service.update(@project["id"], %Project{name: "lalala"})
        assert ^result = {:ok, "Updated project id => #{@project["id"]}"}
      end
    end

    test "when project is not found" do
      with_mock HttpHelper,
        update: fn _, _ ->
          {:error, %Tesla.Env{body: nil}}
        end do
        result = Service.update(@project["id"], %Project{name: "lalala"})
        assert ^result = {:error, "Error to update project with id #{@project["id"]}"}
      end
    end
  end
end
