defmodule Hadaly.Dockerhub.Payload.Repository do
  defstruct status: nil,
            description: "",
            is_trusted: false,
            full_description: "",
            repo_url: nil,
            owner: nil,
            is_official: false,
            is_private: false,
            name: nil,
            namespace: nil,
            star_count: 0,
            comment_count: 0,
            date_created: nil,
            repo_name: nil,
            dockerfile: ""

  use ExConstructor
end
