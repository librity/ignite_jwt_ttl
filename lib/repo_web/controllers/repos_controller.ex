defmodule RepoWeb.ReposController do
  use RepoWeb, :controller

  alias Github.RepoInfo
  alias RepoWeb.FallbackController

  action_fallback FallbackController

  def show(conn, %{"username" => username}) do
    client = get_github_client()

    with {:ok, [%RepoInfo{} | _tails] = repos} <- client.get_user_repos(username) do
      new_token = conn.private[:refresh_token]

      conn
      |> put_status(:ok)
      |> render("repos.json", repos: repos, new_token: new_token)
    end
  end

  defp get_github_client do
    :repo
    |> Application.fetch_env!(__MODULE__)
    |> Keyword.get(:github_adapter)
  end
end
