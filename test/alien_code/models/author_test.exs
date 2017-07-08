defmodule AlienCode.Models.AuthorTest do
  use ExUnit.Case
  alias AlienCode.Models.Author

  describe "changeset/2" do
    test "when received all params valids" do
      changeset = Author.changeset(%Author{},
      %{
        login: "isaaclog",
        email: "isaaczoi@gmail.com",
        pass_unencrypted: "12345678A",
        display_name: "Isaac Y",
        nicename: "isaac-yung"
      })

      assert changeset.valid?
    end

    test "when received param pass invalid" do
      changeset = Author.changeset(%Author{},
      %{
        login: "isaaclog",
        email: "isaaczoi@gmail.com",
        pass_unencrypted: "1234",
        display_name: "Isaac Y",
        nicename: "isaac-yung"
      })

      refute changeset.valid?
    end

    test "when not received the required param display_name" do
      changeset = Author.changeset(%Author{},
      %{
        login: "isaaclog",
        email: "isaaczoi@gmail.com",
        pass_unencrypted: "123456",
        nicename: "isaac-yung"
      })

      refute changeset.valid?
    end
  end
end
