defmodule ExAppointment.Repo do
  use Ecto.Repo,
    otp_app: :ex_appointment,
    adapter: Ecto.Adapters.Postgres
end
