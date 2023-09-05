Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :wish_lists
  resources :pets do
    
    resources :medicines, only: [:new, :create]
    resources :vaccines, only: [:new, :create]
  end
  get 'dossier', to: "pages#dossier"
end
