defmodule Horizon65Web.CartLive.Index do
  @moduledoc """
  Cart Module. Deals with selecting products and adding to cart
  """
  use Horizon65Web, :live_view
  alias Horizon65.Products

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :products, list_products())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
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
