defmodule Cartographers.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Cartographers.Repo,
      # Start the Telemetry supervisor
      CartographersWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Cartographers.PubSub},
      # Start the Endpoint (http/https)
      CartographersWeb.Endpoint
      # Start a worker by calling: Cartographers.Worker.start_link(arg)
      # {Cartographers.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Cartographers.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    CartographersWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
