ExUnit.start()
Ecto.Adapters.SQL.Sandbox.mode(Repo.Repo, :manual)

Mox.defmock(Github.ClientMock, for: Github.Behaviour)
