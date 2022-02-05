defmodule Exlivery.Orders.Item do
  @categories [:pizza, :hamburguer, :prato_feito, :sushi]

  @keys [:description, :category, :unit_price, :quantity]

  @enforce_keys @keys

  defstruct @keys

  def new(description, category, unit_price, quantity)
      when quantity > 0 and category in @categories do
    unit_price
    |> Decimal.cast()
    |> new_item(description, category, quantity)
  end

  def new(_description, _category, _unit_price, _quantity) do
    {:error, "Invalid params!"}
  end

  def new_item({:ok, unit_price}, description, category, quantity) do
    {
      :ok,
      %__MODULE__{
        category: category,
        description: description,
        unit_price: unit_price,
        quantity: quantity
      }
    }
  end

  def new_item(:error, _description, _category, _quantity) do
    {:error, "Invalid price!"}
  end
end
