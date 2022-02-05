defmodule Exlivery.Orders.OrderTest do
  use ExUnit.Case

  alias Exlivery.Orders.Order

  import Exlivery.Factory

  describe "new/2" do
    test "when all params valid, returns the order" do
      user = build(:user)

      items = [
        build(:item),
        build(:item, description: "Temaki", category: :sushi)
      ]

      response = Order.new(user, items)

      expected_response = {:ok, build(:order)}

      assert response == expected_response
    end

    test "when params invalid, returns the error" do
      user = build(:user)

      items = []

      response = Order.new(user, items)

      expected_response = {:error, "Invalid params!"}

      assert response == expected_response
    end
  end
end
