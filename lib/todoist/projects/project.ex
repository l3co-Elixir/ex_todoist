defmodule Todoist.Projects.Project do
  alias Todoist.Projects.Project

  @derive Jason.Encoder
  defstruct id: nil,
            parent_id: nil,
            name: nil,
            color: 0,
            comment_count: nil,
            favorite: false,
            inbox_projet: nil,
            shared: false,
            sync_id: 0

  def parse(project) do
    %Project{
      id: Map.get(project, "id", nil),
      parent_id: Map.get(project, "parent_id", nil),
      name: Map.get(project, "name", nil),
      color: Map.get(project, "color", 0),
      comment_count: Map.get(project, "comment_count", 0),
      favorite: Map.get(project, "favorite", false),
      inbox_projet: Map.get(project, "inbox_projet", false),
      shared: Map.get(project, "shared", false),
      sync_id: Map.get(project, "sync_id", nil)
    }
  end
end
