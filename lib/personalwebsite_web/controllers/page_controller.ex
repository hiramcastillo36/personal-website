defmodule PersonalwebsiteWeb.PageController do
  use PersonalwebsiteWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
