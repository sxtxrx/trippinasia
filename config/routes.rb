Rails.application.routes.draw do
  devise_for :users
  root to: "prototypes#index"
  resources :prototypes do
    resources :comments, only: [:create,:destroy]
  end
  resources :prototypes do
    post 'add' => 'likes#create'
    delete '/add' => 'likes#destroy'
  end

  resources :users, only: :show
  resources :abouts, only: :index
end