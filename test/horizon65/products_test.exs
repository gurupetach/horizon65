defmodule Horizon65.ProductsTest do
  use Horizon65.DataCase

  alias Horizon65.Products

  describe "products" do
    alias Horizon65.Products.Product

    import Horizon65.ProductsFixtures

    @invalid_attrs %{code: nil, name: nil, price: nil}

    test "list_products/0 returns all products" do
      product = product_fixture()
      assert Products.list_products() == [product]
    end

    test "get_product!/1 returns the product with given id" do
      product = product_fixture()
      assert Products.get_product!(product.id) == product
    end

    test "create_product/1 with valid data creates a product" do
      valid_attrs = %{code: "some code", name: "some name", price: 42}

      assert {:ok, %Product{} = product} = Products.create_product(valid_attrs)
      assert product.code == "some code"
      assert product.name == "some name"
      assert product.price == 42
    end

    test "create_product/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Products.create_product(@invalid_attrs)
    end
  end
end
