Rails.application.routes.draw do
  devise_for :users
  root to: "prototypes#index"
  resources :prototypes do
    resources :comments, only: [:create,:destroy]
    resources :prototypes
      post 'add' => 'likes#create'
      delete '/add' => 'likes#destroy'
    
  end
  get 'prototypes/search'

  resources :users, only: :show
end