defmodule RepoWeb.Plugs.TokenRefresher do
  import Plug.Conn

  alias Plug.Conn
  alias RepoWeb.Auth.Guardian

  def init(options), do: options

  def call(%Conn{} = conn, _options) do
    with ["Bearer " <> old_token] <- get_req_header(conn, "authorization"),
         {:ok, new_token} <- Guardian.refresh_token(old_token) do
      put_private(conn, :refresh_token, new_token)
    else
      {:error, reason} -> render_error(conn, reason)
    end
  end

  defp render_error(conn, reason) do
    body = Jason.encode!(%{message: to_string(reason)})

    conn
    |> put_resp_content_type("application/json")
    |> send_resp(:bad_request, body)
    |> halt()
  end
end
