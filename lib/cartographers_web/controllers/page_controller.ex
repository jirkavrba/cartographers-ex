defmodule CartographersWeb.PageController do
  use CartographersWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
