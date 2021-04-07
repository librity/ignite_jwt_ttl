defmodule Github.RepoInfo do
  @keys [:id, :name, :description, :html_url, :stargazers_count]

  @enforce_keys @keys

  @derive {Jason.Encoder, only: @keys}

  defstruct @keys

  def build(raw_repo) do
    %__MODULE__{
      id: raw_repo["id"],
      name: raw_repo["name"],
      description: raw_repo["description"],
      html_url: raw_repo["html_url"],
      stargazers_count: raw_repo["stargazers_count"]
    }
  end

  def build_many([_head | _tail] = raw_repos) do
    Enum.map(raw_repos, fn raw_repo -> build(raw_repo) end)
  end
end
