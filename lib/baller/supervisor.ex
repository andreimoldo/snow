defmodule Snow.Baller.Supervisor do
  use Supervisor
  alias Snow.Baller.{Streamer,Store}

  def start_link do
    Supervisor.start_link(__MODULE__, [])
  end

  def init(_) do
    children = [
      worker(Store, []),
    ]

    supervise(children, strategy: :one_for_one)
  end
end
