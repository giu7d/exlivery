defmodule Exlivery.Orders.ItemTest do
  use ExUnit.Case

  alias Exlivery.Orders.Item

  import Exlivery.Factory

  describe "new/4" do
    test "when all params valid, returns the item" do
      response = Item.new("Pizza Queijo", :pizza, "35.5", 1)

      expected_response = {:ok, build(:item)}

      assert response == expected_response
    end

    test "when invalid category, returns an error" do
      response = Item.new("Pizza Queijo", :invalid, "35.5", 1)

      expected_response = {:error, "Invalid params!"}

      assert response == expected_response
    end

    test "when invalid price, returns an error" do
      response = Item.new("Pizza Queijo", :pizza, "invalid", 1)

      expected_response = {:error, "Invalid price!"}

      assert response == expected_response
    end

    test "when invalid quantity, returns an error" do
      response = Item.new("Pizza Queijo", :pizza, "35.5", 0)

      expected_response = {:error, "Invalid params!"}

      assert response == expected_response
    end
  end
end
