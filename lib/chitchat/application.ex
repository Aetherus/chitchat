defmodule Chitchat.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    # List all child processes to be supervised
    children = [
      cluster_supervisor(),
      # Start the endpoint when the application starts
      ChitchatWeb.Endpoint
      # Starts a worker by calling: Chitchat.Worker.start_link(arg)
      # {Chitchat.Worker, arg},
    ] |> Enum.filter(& &1)

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Chitchat.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    ChitchatWeb.Endpoint.config_change(changed, removed)
    :ok
  end

  defp cluster_supervisor do
    case Application.get_env(:libcluster, :topologies) do
      nil -> nil
      topologies -> {Cluster.Supervisor, [topologies, [name: Chitchat.ClusterSupervisor]]}
    end
  end

end
