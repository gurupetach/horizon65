defmodule Horizon65Web.CartLiveTest do
  use Horizon65Web.ConnCase

  import Phoenix.LiveViewTest

  import Horizon65.ProductsFixtures
  alias Horizon65.Repo
  alias Horizon65.Products.Product

  defp create_product(_) do
    product = product_fixture()
    %{product: product}
  end

  describe "Index" do
    setup [:create_product]

    test "lists all products", %{conn: conn, product: product} do
      {:ok, _index_live, html} = live(conn, Routes.cart_index_path(conn, :index))

      assert html =~ "Listing Products"
      assert html =~ product.name
    end

    test "clicking checkout with voucher, tshirt, mug returns 32.5", %{conn: conn} do
      voucher =
        Repo.insert!(%Product{
          code: "VOUCHER",
          name: "Cabify Voucher",
          price: 5.00
        })

      tshirt =
        Repo.insert!(%Product{
          code: "TSHIRT",
          name: "Cabify T-Shirt",
          price: 20.00
        })

      mug =
        Repo.insert!(%Product{
          code: "MUG",
          name: "Cabify Coffee Mug",
          price: 7.50
        })

      {:ok, index_live, _html} = live(conn, Routes.cart_index_path(conn, :index))

      assert index_live
             |> element("#product-#{voucher.id} a", "Add")
             |> render_click()

      assert index_live
             |> element("#product-#{tshirt.id} a", "Add")
             |> render_click()

      assert index_live
             |> element("#product-#{mug.id} a", "Add")
             |> render_click()

      assert index_live |> element("a", "CHECKOUT") |> render_click() =~
               "32.5"
    end

    test "clicking checkout with voucher, tshirt, voucher returns 25.0", %{conn: conn} do
      voucher =
        Repo.insert!(%Product{
          code: "VOUCHER",
          name: "Cabify Voucher",
          price: 5.00
        })

      tshirt =
        Repo.insert!(%Product{
          code: "TSHIRT",
          name: "Cabify T-Shirt",
          price: 20.00
        })

      {:ok, index_live, _html} = live(conn, Routes.cart_index_path(conn, :index))

      assert index_live
             |> element("#product-#{voucher.id} a", "Add")
             |> render_click()

      assert index_live
             |> element("#product-#{tshirt.id} a", "Add")
             |> render_click()

      assert index_live
             |> element("#product-#{voucher.id} a", "Add")
             |> render_click()

      assert index_live |> element("a", "CHECKOUT") |> render_click() =~
               "25.0"
    end

    test "clicking checkout with tshirt, tshirt, tshirt, voucher, tshirt returns 81.0", %{
      conn: conn
    } do
      voucher =
        Repo.insert!(%Product{
          code: "VOUCHER",
          name: "Cabify Voucher",
          price: 5.00
        })

      tshirt =
        Repo.insert!(%Product{
          code: "TSHIRT",
          name: "Cabify T-Shirt",
          price: 20.00
        })

      {:ok, index_live, _html} = live(conn, Routes.cart_index_path(conn, :index))

      assert index_live
             |> element("#product-#{tshirt.id} a", "Add")
             |> render_click()

      assert index_live
             |> element("#product-#{tshirt.id} a", "Add")
             |> render_click()

      assert index_live
             |> element("#product-#{tshirt.id} a", "Add")
             |> render_click()

      assert index_live
             |> element("#product-#{voucher.id} a", "Add")
             |> render_click()

      assert index_live
             |> element("#product-#{tshirt.id} a", "Add")
             |> render_click()

      assert index_live |> element("a", "CHECKOUT") |> render_click() =~
               "81.0"
    end

    test "clicking checkout with voucher, tshirt, voucher, voucher, mug, tshirt, tshirt returns 74.5",
         %{conn: conn} do
      voucher =
        Repo.insert!(%Product{
          code: "VOUCHER",
          name: "Cabify Voucher",
          price: 5.00
        })

      tshirt =
        Repo.insert!(%Product{
          code: "TSHIRT",
          name: "Cabify T-Shirt",
          price: 20.00
        })

      mug =
        Repo.insert!(%Product{
          code: "MUG",
          name: "Cabify Coffee Mug",
          price: 7.50
        })

      {:ok, index_live, _html} = live(conn, Routes.cart_index_path(conn, :index))

      assert index_live
             |> element("#product-#{voucher.id} a", "Add")
             |> render_click()

      assert index_live
             |> element("#product-#{tshirt.id} a", "Add")
             |> render_click()

      assert index_live
             |> element("#product-#{voucher.id} a", "Add")
             |> render_click()

      assert index_live
             |> element("#product-#{voucher.id} a", "Add")
             |> render_click()

      assert index_live
             |> element("#product-#{mug.id} a", "Add")
             |> render_click()

      assert index_live
             |> element("#product-#{tshirt.id} a", "Add")
             |> render_click()

      assert index_live
             |> element("#product-#{tshirt.id} a", "Add")
             |> render_click()

      assert index_live |> element("a", "CHECKOUT") |> render_click() =~
               "74.5"
    end
  end
end
