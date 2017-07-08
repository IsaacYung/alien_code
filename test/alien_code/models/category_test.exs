defmodule AlienCode.Models.CategoryTest do
  use ExUnit.Case
  alias AlienCode.Models.Category

  describe "changeset/2" do
    test "when received all params valids" do
      changeset = Category.changeset(%Category{},
      %{
        name: "linguagens",
        nicename: "Linguagens",
        description: "Linguagens de programação modernas"
      })

      assert changeset.valid?
    end

    test "when received param name invalid" do
      changeset = Category.changeset(%Category{},
      %{
        name: "li",
        nicename: "Linguagens",
        description: "Linguagens de programação modernas"
      })

      refute changeset.valid?
    end

    test "when not received the required param nicename" do
      changeset = Category.changeset(%Category{},
      %{
        name: "linguagens",
        description: "Linguagens de programação modernas"
      })

      refute changeset.valid?
    end
  end
end
