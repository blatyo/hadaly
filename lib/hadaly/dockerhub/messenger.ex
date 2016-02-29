defmodule Hadaly.Dockerhub.Messenger do
  alias Hadaly.Dockerhub.Payload
  alias Hadaly.Slack.Message

  def send_message(params) do
    %Payload{repository: repository, push_data: push_data} = Payload.build(params)

    text = "#{push_data.pusher} pushed `#{repository.repo_name}:#{push_data.tag}` to DockerHub (#{repository.repo_url})"

    send :slack, %Message{channel_name: "dockerhub", text: text}
  end
end
