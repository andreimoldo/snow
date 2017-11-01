defmodule Snow.Baller.Store do
  use GenServer

  def start_link do
    GenServer.start_link(__MODULE__, %{}, name: :baller_store)
  end

  def init(_) do
    {:ok, %{}}
  end

  def get_player_data(player) do
    GenServer.call(:baller_store, {:get_player_data, player})
  end

  def set_player_data(player, data) do
    GenServer.call(:baller_store, {:set_player_data, player, data})
  end

  def clear_player_data(player) do
    GenServer.call(:baller_store, {:clear_player_data, player})
  end

  # Callbacks

  def handle_call({:get_player_data, player}, _from, player_data) do
    player_info = Map.get(player_data, player)
    {:reply, player_info, player_data}
  end

  def handle_call({:set_player_data, player, data}, _from, player_data) do
    player_data = Map.put(player_data, player, data)
    {:reply, player_data, player_data}
  end

  def handle_call({:clear_player_data, player}, _from, player_data) do
    {player_data, new_store} = Map.pop(player_data, player)
    {:reply, player_data, new_store}
  end
end
