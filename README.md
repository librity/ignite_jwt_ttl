# Rocket Seat Ignite - JWT Authentication

## Table of Contents

- [About](#about)
- [Endpoints](#endpoints)
- [Setup](#setup)
- [Bash Commands](#bash_commands)
- [Elixir Commands](#elixir_commands)
- [Libs](#libs)
- [Docs](#docs)
- [Resources](#resources)

## About <a name = "about"></a>

An authenticated API made with Phoenix and Guardian.

## Endpoints <a name = "endpoints"></a>

Built-in:

- `GET` http://localhost:4000/dashboard

`Users`

- `POST` http://localhost:4000/api/users
- `POST` http://localhost:4000/api/users/sign_in

`Repos`

- `GET` http://localhost:4000/api/repos/:username

## Setup <a name = "setup"></a>

Install `Erlang`, `Elixir` and `Phoenix`.

## Bash Commands <a name = "bash_commands"></a>

```bash
# Create phoenix app without webpacker or html views
$ mix phx.new app_name --no-webpack --no-html

# Intall dependencies
$ mix deps.get

# Compile project
$ mix compile

# Generate linter config file
$ mix credo.gen.config

# Run linter
$ mix credo --strict

# Start Phoenix dev server on http://localhost:4000
$ mix phx.server

# Start your project as an Interactive Elixir session
$ iex -S mix

# List all configured routes
$ mix phx.routes
```

Tests

```bash
# Run tests
$ mix test

# Run tests w/ coverage report
$ mix test --cover
```

## Elixir Commands <a name = "elixir_commands"></a>

Github client:

```elixir
> Github.Client.get_user_repos("teamon")
> Github.Client.get_user_repos("danilo-vieira")
> Github.Client.get_user_repos("librity")
```

## Libs <a name = "libs"></a>

- https://github.com/phoenixframework/phoenix
- https://github.com/teamon/tesla
- https://github.com/PSPDFKit-labs/bypass
- https://github.com/dashbitco/mox
- https://github.com/thoughtbot/ex_machina
- https://github.com/riverrun/pbkdf2_elixir
- https://github.com/ueberauth/guardian

## Docs <a name = "docs"></a>

- https://elixir-lang.org/crash-course.html

## Resources <a name = "resources"></a>

- https://www.tutorialspoint.com/elixir/elixir_lists_and_tuples.htm
- https://stackoverflow.com/questions/29566248/how-to-use-io-inspect-on-a-long-list-without-trimming-it
- https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/User-Agent
