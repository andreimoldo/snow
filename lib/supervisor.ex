defmodule Snow.Supervisor do
  use Supervisor

  def start_link do
    Supervisor.start_link(__MODULE__, [])
  end

  def init(_) do
    children = [
      supervisor(Snow.Baller.Supervisor, [])
    ]

    supervise(children, strategy: :one_for_all)
  end
end
