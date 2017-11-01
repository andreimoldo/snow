defmodule Snow do
  use Application

  def start(_type, _args) do
    Snow.Supervisor.start_link
  end
end
