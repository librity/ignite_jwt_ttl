# Create user:
user_params = %{"password" => "password"}
Repo.Users.Create.call(user_params)
Repo.create_user(user_params)

bad_params = %{"password" => "1"}
Repo.create_user(bad_params)

# Token
params = %{"id" => 5,"password" => "123456"}
{:ok, token} = RepoWeb.Auth.Guardian.authenticate(params)
RepoWeb.Auth.Guardian.refresh(token, ttl: {1, :minute})
