defmodule RepoWeb.Auth.Guardian do
  use Guardian, otp_app: :repo

  alias Repo.{Error, User}
  alias Repo.Users.Get, as: GetUser

  @expiration  {1, :minute}

  def subject_for_token(%User{id: user_id}, _claims), do: {:ok, user_id}

  def resource_from_claims(claims) do
    claims
    |> Map.get("sub")
    |> GetUser.by_id()
  end

  def authenticate(%{"id" => user_id, "password" => password}) do
    with {:ok, %User{password_hash: hash} = user} <- GetUser.by_id(user_id),
         true <- Pbkdf2.verify_pass(password, hash),
         {:ok, token, _claims} <- encode_and_sign(user, %{}, ttl: @expiration) do
      {:ok, token}
    else
      false -> {:error, Error.build(:unauthorized, "Please verify your credentials")}
      error -> error
    end
  end

  def authenticate(_), do: {:error, Error.build(:bad_request, "Invalid params")}

  def refresh_token(old_token) do
    case RepoWeb.Auth.Guardian.refresh(old_token, ttl: @expiration) do
      {:ok, _old, {new_token, _new_claims}} -> {:ok, new_token}
      error -> error
    end
  end
end
