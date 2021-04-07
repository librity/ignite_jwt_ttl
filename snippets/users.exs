# Create user:
user_params = %{"password" => "password"}
Repo.Users.Create.call(user_params)
Repo.create_user(user_params)

bad_params = %{"password" => "1"}
Repo.create_user(bad_params)
