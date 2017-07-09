defmodule AlienCode.Presenters.Response do
  alias __MODULE__

  defstruct status: 200, body: "OK"

  def build(status, content) do
    body = Poison.encode!(content)
    %Response{status: status, body: body}
  end
end
