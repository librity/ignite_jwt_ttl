defmodule RepoWeb.UsersView do
  use RepoWeb, :view

  def render("create.json", %{user: user}),
    do: %{message: "User created successfully", user: user}

  def render("sign_in.json", %{token: token}), do: %{token: token}
end
