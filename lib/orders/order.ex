defmodule Exlivery.Orders.Order do
  alias Exlivery.Users.User
  alias Exlivery.Orders.Item

  @keys [:user_cpf, :delivery_address, :items, :total_price]

  @enforce_keys @keys

  defstruct @keys

  def new(
        %User{cpf: cpf, address: address},
        [%Item{} | _items] = items
      ) do
    {
      :ok,
      %__MODULE__{
        user_cpf: cpf,
        delivery_address: address,
        items: items,
        total_price: calculate_total_prices(items)
      }
    }
  end

  def new(_user, _items) do
    {:error, "Invalid params!"}
  end

  defp calculate_total_prices(items) do
    Enum.reduce(
      items,
      Decimal.new("0.00"),
      &sum_prices(&1, &2)
    )
  end

  def sum_prices(%Item{unit_price: price, quantity: quantity}, acc) do
    price
    |> Decimal.mult(quantity)
    |> Decimal.add(acc)
  end
end
