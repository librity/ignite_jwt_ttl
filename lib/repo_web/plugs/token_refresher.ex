defmodule RepoWeb.Plugs.TokenRefresher do
  import Plug.Conn

  alias Plug.Conn

  def init(options), do: options

  def call(%Conn{private: %{guardian_default_token: token}} = conn, _options) do
    case RepoWeb.Auth.Guardian.refresh(token, ttl: {1, :minute}) do
      {:error, reason} -> render_error(conn, reason)
      {:ok, _old, {new_token, _new_claims}} -> Map.put(conn, :new_token, new_token)
    end
  end

  def call(conn, _options), do: conn

  defp render_error(conn, reason) do
    body = Jason.encode!(%{message: to_string(reason)})

    conn
    |> put_resp_content_type("application/json")
    |> send_resp(:bad_request, body)
    |> halt()
  end
end
