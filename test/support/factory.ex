defmodule Exlivery.Factory do
  use ExMachina

  alias Exlivery.Users.User
  alias Exlivery.Orders.{Item, Order}

  def user_factory do
    %User{
      address: "5th Street, NY",
      age: 19,
      cpf: "1231231232",
      email: "mail@domain.com",
      name: "John"
    }
  end

  def item_factory do
    %Item{
      category: :pizza,
      description: "Pizza Queijo",
      quantity: 1,
      unit_price: Decimal.new("35.5")
    }
  end

  def order_factory do
    %Order{
      delivery_address: "5th Street, NY",
      items: [
        build(:item),
        build(:item, description: "Temaki", category: :sushi)
      ],
      total_price: Decimal.new("71.00"),
      user_cpf: "1231231232"
    }
  end
end
