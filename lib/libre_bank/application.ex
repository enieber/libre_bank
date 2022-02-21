defmodule LibreBank.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      LibreBank.Repo,
      # Start the Telemetry supervisor
      LibreBankWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: LibreBank.PubSub},
      # Start the Endpoint (http/https)
      LibreBankWeb.Endpoint
      # Start a worker by calling: LibreBank.Worker.start_link(arg)
      # {LibreBank.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: LibreBank.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    LibreBankWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
