defmodule Horizon65.Products.Product do
  use Ecto.Schema
  import Ecto.Changeset

  schema "products" do
    field :code, :string
    field :name, :string
    field :price, :integer

    timestamps()
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:code, :name, :price])
    |> validate_required([:code, :name, :price])
  end
end
