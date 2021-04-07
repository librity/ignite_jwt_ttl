defmodule RepoWeb.ReposView do
  use RepoWeb, :view

  alias Github.RepoInfo

  def render("repos.json", %{repos: [%RepoInfo{} | _tails] = repos}), do: %{repos: repos}
end
