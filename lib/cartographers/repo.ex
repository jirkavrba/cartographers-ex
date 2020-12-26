defmodule Cartographers.Repo do
  use Ecto.Repo,
    otp_app: :cartographers,
    adapter: Ecto.Adapters.Postgres
end
