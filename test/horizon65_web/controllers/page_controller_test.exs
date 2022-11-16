defmodule Horizon65Web.PageControllerTest do
  use Horizon65Web.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Listing Products"
  end
end
