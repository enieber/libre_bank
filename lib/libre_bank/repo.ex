defmodule LibreBank.Repo do
  use Ecto.Repo,
    otp_app: :libre_bank,
    adapter: Ecto.Adapters.Postgres
end
