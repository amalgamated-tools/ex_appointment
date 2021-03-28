defmodule ExAppointmentWeb.UserOAuthController do
  use ExAppointmentWeb, :controller

  def index(conn, %{"provider" => provider} = params) do
    redirect(conn, external: authorize_url!(provider, %{redirect_uri: params["redirect_uri"]}))
  end

  defp authorize_url!("google", _params),
    do:
      ExAppointment.Google.authorize_url!(
        scope: "https://www.googleapis.com/auth/plus.profile.emails.read"
      )
end
