defmodule Hadaly.Slack do
  use Slack
  require Logger
  require IEx
  alias Hadaly.Slack.Message

  def handle_connect(slack, state) do
    try do
      Process.register(self, :slack)

      Logger.info "Connected to Slack as #{slack.me.name}"
    rescue
      error -> Logger.error "Unable to connect to Slack\n#{inspect error}"
    end

    {:ok, state}
  end

  def handle_close(reason, slack, state) do
    Logger.error "Disconnected from Slack\n#{inspect reason}"
    {:error, state}
  end

  def handle_message(_message, _slack, state), do: {:ok, state}

  def handle_info(%Message{} = message, slack, state) do
    channel = slack.channels |> Map.values |> Enum.find(&(&1.name == message.channel_name))

    send_message(message.text, channel.id, slack)

    {:ok, state}
  end

end
