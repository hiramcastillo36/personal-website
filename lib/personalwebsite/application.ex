defmodule Personalwebsite.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Personalwebsite.Repo,
      # Start the Telemetry supervisor
      PersonalwebsiteWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Personalwebsite.PubSub},
      # Start the Endpoint (http/https)
      PersonalwebsiteWeb.Endpoint
      # Start a worker by calling: Personalwebsite.Worker.start_link(arg)
      # {Personalwebsite.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Personalwebsite.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    PersonalwebsiteWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
