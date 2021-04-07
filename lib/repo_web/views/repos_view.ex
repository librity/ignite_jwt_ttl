defmodule RepoWeb.ReposView do
  use RepoWeb, :view

  alias Github.RepoInfo

  def render("repos.json", %{repos: [%RepoInfo{} | _tails] = repos, new_token: new_token}),
    do: %{new_token: new_token, repos: repos}
end
