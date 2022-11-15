defmodule Horizon65Web.PageController do
  use Horizon65Web, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
