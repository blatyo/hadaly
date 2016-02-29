defmodule Hadaly.CallbackController do
  use Hadaly.Web, :controller
  require IEx

  def receive(conn, %{"provider" => "dockerhub"}) do
    Hadaly.Dockerhub.Messenger.send_message(conn.params)

    conn |> send_resp(204, "")
  end
end
