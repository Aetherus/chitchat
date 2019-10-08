defmodule ChitchatWeb.Router do
  use ChitchatWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ChitchatWeb do
    pipe_through :browser

    get "/", PageController, :index

    resources "/rooms", RoomController, only: [:index, :show]
  end

  # Other scopes may use custom stacks.
  # scope "/api", ChitchatWeb do
  #   pipe_through :api
  # end
end
