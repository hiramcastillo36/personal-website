defmodule Personalwebsite.Repo do
  use Ecto.Repo,
    otp_app: :personalwebsite,
    adapter: Ecto.Adapters.Postgres
end
