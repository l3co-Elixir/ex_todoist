defmodule Todoist.Entities.Project do

  @moduledoc """
  Todoist.Entities.Project represent a entity project into Todoist workspace
  """

  @derive Jason.Encoder
  defstruct parent_id: nil,
            name: nil,
            color: 0,
            favorite: false
end
