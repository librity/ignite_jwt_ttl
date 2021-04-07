defmodule Repo.Factory do
  use ExMachina.Ecto, repo: Repo.Repo

  alias Github.RepoInfo
  alias Repo.User

  def user_factory do
    %User{password: "first_rule"}
  end

  def repo_info_factory do
    %RepoInfo{
      id: 339_136_738,
      name: "c_makefile_template",
      description:
        "C Project Template with Makefile, based on: https://github.com/dutenrapha/makefile",
      html_url: "https://github.com/librity/c_makefile_template",
      stargazers_count: 1
    }
  end

  def user_repos_body_factory(_attrs) do
    ~s(
      [
        {
          "id": 213098242,
          "name": "aircnc_full_stack",
          "description": "Rocket Seat - Omnistack Week 9 - Full stack web and mobile app that allows tech companies to host prospective programmers for a day.",
          "html_url": "https://github.com/librity/aircnc_full_stack",
          "stargazers_count": 3
        }
      ]
    )
  end
end
