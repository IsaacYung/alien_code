defmodule AlienCode.Models.TagTest do
  use ExUnit.Case
  alias AlienCode.Models.Tag

  describe "changeset/2" do
    test "when received all params valids" do
      changeset = Tag.changeset(%Tag{},
      %{
        name: "programacao",
        nicename: "Programaçâo"
      })

      assert changeset.valid?
    end

    test "when received param name with invalid length" do
      changeset = Tag.changeset(%Tag{},
      %{
        name: "pr",
        nicename: "Programaçâo"
      })

      refute changeset.valid?
    end

    test "when not received the required param nicename" do
      changeset = Tag.changeset(%Tag{},
      %{
        name: "programacao"
      })

      refute changeset.valid?
    end
  end
end
