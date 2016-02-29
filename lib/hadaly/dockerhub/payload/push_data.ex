defmodule Hadaly.Dockerhub.Payload.PushData do
  defstruct pushed_at: :os.system_time(:seconds),
            images: [],
            tag: nil,
            pusher: nil

  use ExConstructor
end
