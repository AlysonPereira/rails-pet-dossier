Rails.application.routes.draw do
  devise_for :users
  authenticated :user do
    root to: "pages#landingpage", as: :authenticated_root
  end
  unauthenticated :user do
    root to: "pages#home"
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :wish_lists do
    resources :products, only: %i[new create]
    get '/search', to: "products#search", as: :search
    get "/searchweb", to: "products#searchweb", as: :searchweb
    post "/webcreate", to: "products#webcreate", as: :webcreate
  end

  resources :pets do
    resources :medicines, only: %i[index new create]
    resources :vaccines, only: %i[index new create edit]
    post "/revaccine", to: "vaccines#revaccine", as: :revaccine
    post "/finish", to: "medicines#finish", as: :finish
  end

  resources :medicines, only: %i[destroy]
  resources :vaccines, only: %i[destroy]
  resources :products, only: %i[destroy]
  get 'dossier', to: "pages#dossier"
  get 'landingpage', to: "pages#landingpage"
  get 'find-petshop', to: "pages#find-petshop"
end
