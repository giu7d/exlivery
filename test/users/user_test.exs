defmodule Exlivery.Users.UserTest do
  use ExUnit.Case

  alias Exlivery.Users.User

  import Exlivery.Factory

  describe "new/5" do
    test "when all params valid, returns the user" do
      response = User.new("John", "mail@domain.com", "1231231232", 19, "5th Street, NY")

      expected_response = {:ok, build(:user)}

      assert response == expected_response
    end

    test "when age lower than 18, returns an error" do
      response = User.new("John Jr.", "mail@domain.com", "1231231232", 15, "5th Street, NY")

      expected_response = {:error, "Invalid params!"}

      assert response == expected_response
    end
  end
end
