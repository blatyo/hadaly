defmodule Hadaly.Dockerhub.Payload do
  alias Hadaly.Dockerhub.Payload.PushData
  alias Hadaly.Dockerhub.Payload.Repository

  defstruct push_data: %PushData{},
            callback_url: nil,
            repository: %Repository{}

  use ExConstructor

  def build(map_or_kwlist) do
    payload = new(map_or_kwlist)

    struct(payload, %{
      push_data: PushData.new(payload.push_data),
      repository: Repository.new(payload.repository)
    })
  end
end
