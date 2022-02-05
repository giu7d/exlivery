defmodule Exlivery.Users.User do
  @keys [:name, :email, :cpf, :age, :address]

  @enforce_keys @keys

  defstruct @keys

  def new(name, email, cpf, age, address) when age >= 18 and is_bitstring(cpf) do
    {
      :ok,
      %__MODULE__{
        address: address,
        name: name,
        email: email,
        cpf: cpf,
        age: age
      }
    }
  end

  def new(_name, _email, _cpf, _age, _address), do: {:error, "Invalid params!"}
end
