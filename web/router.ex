defmodule Touchbaseapi.Router do
  use Touchbaseapi.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Touchbaseapi do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  scope "/api/v1/", Touchbaseapi do
    pipe_through :api
    resources "/knowledgebases", KnowledgebaseController
  end

  # Other scopes may use custom stacks.
  # scope "/api", Touchbaseapi do
  #   pipe_through :api
  # end
end
