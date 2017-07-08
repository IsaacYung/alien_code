defmodule AlienCode.Models.PostTest do
  use ExUnit.Case
  alias AlienCode.Models.Post

  describe "changeset/2" do
    test "when received all params valids" do
      changeset = Post.changeset(%Post{},
      %{
        title: "Elixir, vale a pena?",
        content: "Elixir vale a pena usar ...",
        name: "elixir-vale-a-pena",
        excerpt: "Elixir vale a ...",
        type: "POST"
      })

      assert changeset.valid?
    end

    test "when received param content with invalid length" do
      changeset = Post.changeset(%Post{},
      %{
        title: "Elixir, vale a pena?",
        content: "Elixir",
        name: "elixir-vale-a-pena",
        excerpt: "Elixir vale a ...",
        type: "POST"
      })

      refute changeset.valid?
    end

    test "when not received the required param nicename" do
      changeset = Post.changeset(%Post{},
      %{
        title: "Elixir, vale a pena?",
        content: "Elixir vale a pena usar ...",
        excerpt: "Elixir vale a ...",
        type: "POST"
      })

      refute changeset.valid?
    end
  end
end
