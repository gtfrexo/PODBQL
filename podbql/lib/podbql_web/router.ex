defmodule PodbqlWeb.Router do
  use PodbqlWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PodbqlWeb do
    pipe_through :api
    resources "/persons", PersonController, except: [:new, :edit]
    resources "/locations", LocationController, except: [:new, :edit]
    resources "/medias", MediaController, except: [:new, :edit]
    resources "/venues", VenueController, except: [:new, :edit]
    resources "/events", EventController, except: [:new, :edit]
    resources "/hosts", HostController, except: [:new, :edit]
    resources "/files", FileController, except: [:new, :edit]
    resources "/pools", FileController, except: [:new, :edit]
    resources "/messages", MessageController, except: [:new, :edit]
    resources "/chats", ChatController, except: [:new, :edit]
  end

  forward "/api", Absinthe.Plug,
    schema: PodbqlWeb.Schema

  forward "/graphiql", Absinthe.Plug.GraphiQL,
    schema: PodbqlWeb.Schema


end
