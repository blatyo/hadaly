ExUnit.start

Mix.Task.run "ecto.create", ~w(-r Cartero.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r Cartero.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(Cartero.Repo)

