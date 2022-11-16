defmodule Horizon65Web.CartLive.Index do
  @moduledoc """
  Cart Module. Deals with selecting products and adding to cart
  """
  use Horizon65Web, :live_view
  alias Horizon65.Repo
  alias Horizon65.{Rule, Products}

  @impl true
  def mount(_params, _session, socket) do
    socket =
      socket
      |> assign(:products, list_products())
      |> assign(:selected_items, [])
      |> assign(:price, 0)

    {:ok, socket}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  @impl true
  def handle_event("add", %{"code" => code}, socket) do
    product = Products.get_selected_product_query!(code) |> Repo.one()

    selected_items = socket.assigns.selected_items ++ [product]

    {:noreply, assign(socket, :selected_items, selected_items)}
  end

  def handle_event("checkout", %{}, socket) do
    voucher_count = Enum.count(socket.assigns.selected_items, fn x -> x.code == "VOUCHER" end)
    tshirt_count = Enum.count(socket.assigns.selected_items, fn x -> x.code == "TSHIRT" end)
    mug_count = Enum.count(socket.assigns.selected_items, fn x -> x.code == "MUG" end)

    price =
      Rule.calculate_price(%{
        voucher_count: voucher_count,
        tshirt_count: tshirt_count,
        mug_count: mug_count
      })

    socket =
      socket
      |> assign(:voucher_count, voucher_count)
      |> assign(:tshirt_count, tshirt_count)
      |> assign(:mug_count, mug_count)
      |> assign(:price, price)

    {:noreply, socket}
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Products")
    |> assign(:product, nil)
  end

  defp list_products do
    Products.list_products()
  end
end
