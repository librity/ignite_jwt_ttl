defmodule Repo.Users.Get do
  alias Repo.Repo, as: DatabaseRepo
  alias Repo.{Error, User}

  def by_id(uuid) do
    case DatabaseRepo.get(User, uuid) do
      nil -> {:error, Error.build_user_not_found_error()}
      %User{} = user -> {:ok, user}
    end
  end
end
