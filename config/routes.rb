Rails.application.routes.draw do
  # get 'lists/:id', to: 'lists#show', as: 'list'
  # get 'lists/new', to: 'lists#new', as: 'new_list'
  # post 'lists', to: 'lists#create'
  devise_for :users
  root to: "lists#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :lists do
    resources :bookmarks
  end
  # resources :reviews, only: :create
  # resources :bookmarks, only: :destroy
  # resources :reviews, only: :destroy
end
