Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :wish_lists do
    resources :products
  end
  resources :pets do
    resources :medicines, only: %i[new create]
    resources :vaccines, only: %i[new create]
  end
  get 'dossier', to: "pages#dossier"
  get 'landingpage', to: "pages#landingpage"
end
