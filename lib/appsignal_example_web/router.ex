defmodule AppsignalExampleWeb.Router do
  use AppsignalExampleWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
    plug OpenApiSpex.Plug.PutApiSpec, module: AppsignalExample.Spec
  end

  scope "/", AppsignalExampleWeb do
    pipe_through :api

    post "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", AppsignalExampleWeb do
  #   pipe_through :api
  # end
end
