defmodule Todoist.Entities.Task do
  @moduledoc """
  Todoist.Entities.Task represent a entity task into Todoist workspace

  ## Example

    iex> %Todoist.Entities.Task{content: "test"}
    %Todoist.Entities.Task{ assignee: 0, content: "test", due_date: nil, due_datetime: nil, due_lang: nil, due_string: nil, label_ids: nil, order: 0, parent_id: 0, priority: 0, project_id: 0, section_id: 0 }
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
