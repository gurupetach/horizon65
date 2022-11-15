defmodule Horizon65.Repo do
  use Ecto.Repo,
    otp_app: :horizon65,
    adapter: Ecto.Adapters.Postgres
end
