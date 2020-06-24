defmodule Todoist.Domain.Project do

  @derive Jason.Encoder
  defstruct parent_id: nil,
            name: nil,
            color: 0,
            favorite: false
end
