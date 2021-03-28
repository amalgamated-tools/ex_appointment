defmodule ExAppointment.Google do
  @moduledoc """
  An OAuth2 strategy for Google.
  """
  use OAuth2.Strategy

  alias OAuth2.Strategy.AuthCode

  defp config do
    [
      strategy: ExAppointment.Google,
      site: "https://accounts.google.com",
      authorize_url: "/o/oauth2/auth",
      token_url: "/o/oauth2/token"
    ]
  end

  def client do
    OAuth2.Client.new(
      strategy: __MODULE__,
      client_id: "457765190268-9f9gvflbp9gbhi4cprv0c69dv2e6j7kl.apps.googleusercontent.com",
      client_secret: "BCHPKetNcNQG3HyqHn3AE2_t",
      redirect_uri: "http://localhost:4000/auth/google/callback",
      site: "https://accounts.google.com",
      authorize_url: "https://accounts.google.com/o/oauth2/auth",
      token_url: "https://accounts.google.com/o/oauth2/token"
    )
    |> OAuth2.Client.put_serializer("application/json", Jason)
  end

  def authorize_url!(params \\ []) do
    OAuth2.Client.authorize_url!(client(), params)
  end

  def get_token!(params \\ [], headers \\ []) do
    OAuth2.Client.get_token!(client(), params)
  end

  def get_token(params \\ [], headers \\ []) do
    OAuth2.Client.get_token(client(), params)
  end

  def authorize_url(client, params) do
    AuthCode.authorize_url(client, params)
  end

  def get_token(client, params, headers) do
    client
    |> put_param(:client_secret, client.client_secret)
    |> put_header("Accept", "application/json")
    |> AuthCode.get_token(params, headers)
  end
end
