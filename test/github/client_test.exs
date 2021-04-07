defmodule Github.ClientTest do
  use ExUnit.Case, async: true

  import Repo.Factory

  alias Github.Client
  alias Plug.Conn
  alias Repo.Error

  describe "get_user_repos/2" do
    setup do
      bypass = Bypass.open()

      {:ok, bypass: bypass}
    end

    test "returns user's repos if user exists", %{bypass: bypass} do
      username = "librity"
      body = build(:user_repos_body)
      url = bypass_url(bypass.port)

      Bypass.expect(bypass, "GET", "/users/#{username}/repos", fn conn ->
        conn
        |> Conn.put_resp_header("content-type", "application/json")
        |> Conn.resp(200, body)
      end)

      response = Client.get_user_repos(url, username)

      expected = {
        :ok,
        [
          %Github.RepoInfo{
            description:
              "Rocket Seat - Omnistack Week 9 - Full stack web and mobile app that allows tech companies to host prospective programmers for a day.",
            html_url: "https://github.com/librity/aircnc_full_stack",
            id: 213_098_242,
            name: "aircnc_full_stack",
            stargazers_count: 3
          }
        ]
      }

      assert expected == response
    end

    test "returns an error if user doesn't exist", %{bypass: bypass} do
      username = "'"
      url = bypass_url(bypass.port)

      Bypass.expect(bypass, "GET", "/users/#{username}/repos", fn conn ->
        conn
        |> Conn.resp(404, "")
      end)

      response = Client.get_user_repos(url, username)

      expected = {:error, %Error{result: "Github user not found", status: :not_found}}

      assert expected == response
    end

    test "returns an error if server is down", %{bypass: bypass} do
      username = "librity"
      url = bypass_url(bypass.port)

      Bypass.down(bypass)

      response = Client.get_user_repos(url, username)

      expected = {:error, %Error{result: :econnrefused, status: :bad_request}}
      assert expected == response
    end
  end

  defp bypass_url(port), do: "http://localhost:#{port}"
end
