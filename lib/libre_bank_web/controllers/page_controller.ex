defmodule LibreBankWeb.PageController do
  use LibreBankWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
