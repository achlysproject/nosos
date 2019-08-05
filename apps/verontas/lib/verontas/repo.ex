defmodule Verontas.Repo do
  use Ecto.Repo,
    otp_app: :verontas,
    adapter: Ecto.Adapters.Postgres
end
