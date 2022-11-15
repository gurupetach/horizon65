defmodule Horizon65.ProductsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Horizon65.Products` context.
  """

  @doc """
  Generate a product.
  """
  def product_fixture(attrs \\ %{}) do
    {:ok, product} =
      attrs
      |> Enum.into(%{
        code: "some code",
        name: "some name",
        price: 42
      })
      |> Horizon65.Products.create_product()

    product
  end
end
