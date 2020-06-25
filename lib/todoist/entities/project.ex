defmodule Todoist.Entities.Project do

  @moduledoc """
  Todoist.Entities.Project represent a entity project into Todoist workspace

  ## Example

      iex> %Todoist.Entities.Project{name: "test", color: 36}
      %Todoist.Entities.Project{ color: 36, favorite: false, name: "test", parent_id: nil }
  """

  @derive Jason.Encoder
  defstruct parent_id: nil,
            name: nil,
            color: 0,
            favorite: false
end
