defmodule RepoWeb.FallbackController do
  use RepoWeb, :controller

  alias Repo.Error
  alias RepoWeb.ErrorView

  def call(conn, {:error, %Error{status: status, result: result}}) do
    conn
    |> put_status(status)
    |> put_view(ErrorView)
    |> render("error.json", result: result)
  end
end
