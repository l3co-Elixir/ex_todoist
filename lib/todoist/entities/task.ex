defmodule Todoist.Entities.Task do
  @moduledoc """
  Todoist.Entities.Task represent a entity task into Todoist workspace
  """

  @derive Jason.Encoder
  defstruct content: nil,
            project_id: 0,
            section_id: 0,
            parent_id: 0,
            order: 0,
            label_ids: nil,
            priority: 0,
            due_string: nil,
            due_date: nil,
            due_datetime: nil,
            due_lang: nil,
            assignee: 0
end
