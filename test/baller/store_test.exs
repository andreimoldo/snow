defmodule Snow.Baller.StoreTest do
  use ExUnit.Case
  alias Snow.Baller.Store
  doctest Snow

  test "get_player_data empty" do
    data = Store.get_player_data(0)

    assert is_nil(data)
  end

  test "put_player_data" do
    %{1 => %{id: id}} = Store.set_player_data(1, %{id: 1})
    assert id === 1
  end

  test "clear_player_data" do
    Store.set_player_data(2, %{id: 2})
    Store.clear_player_data(2)

    data = Store.get_player_data(2)
    assert is_nil(data)
  end
end
