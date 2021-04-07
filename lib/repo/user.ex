defmodule Repo.User do
  use Ecto.Schema

  import Ecto.Changeset

  alias Ecto.Changeset

  @required_params [:password]
  @params @required_params

  @derive {Jason.Encoder, only: [:id]}

  schema "users" do
    field :password, :string, virtual: true
    field :password_hash, :string

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @params)
    |> validate_changeset()
    |> generate_password_hash()
  end

  defp validate_changeset(changeset) do
    changeset
    |> validate_required(@required_params)
    |> validate_length(:password, min: 6)
  end

  defp generate_password_hash(
         %Changeset{valid?: true, changes: %{password: password}} = changeset
       ) do
    changeset
    |> change(Pbkdf2.add_hash(password))
  end

  defp generate_password_hash(changeset), do: changeset
end
