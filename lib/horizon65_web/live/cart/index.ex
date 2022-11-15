defmodule Horizon65Web.CartLive.Index do
  @moduledoc """
  Cart Module. Deals with selecting products and adding to cart
  """
  use Horizon65Web, :live_view
  alias Horizon65.Repo
  alias Horizon65.Products
  alias Horizon65.Products.Product

  @impl true
  def mount(_params, _session, socket) do
    socket =
      socket
      |> assign(:products, list_products())
      |> assign(:selected_items, [])

    {:ok, socket}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  @impl true
  def handle_event("add", %{"code" => code}, socket) do
    # time = Timex.now()
    product = Products.get_selected_product_query!(code) |> Repo.one()

    # selected_items =
    #   socket.assigns.selected_items
    #   |> IO.inspect(label: "================")
    #   |> Map.put(time, product)
    #   |> IO.inspect(label: "================")

    selected_items =
      (socket.assigns.selected_items ++ [product])
      |> IO.inspect(label: "================")

    {:noreply, assign(socket, :selected_items, selected_items)}
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
