
Rails.application.routes.draw do
  # root 'home#index'
  root 'posts#index'

  resources :users
  resources :sessions, only: [:new, :create, :destroy]

  resources :posts
  
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  delete 'logout', to: 'sessions#destroy', as: 'logout'

  resources :posts do
    resources :comments
    resources :upvotes, only: :create, controller: 'posts/upvotes'
    resources :downvotes, only: :create, controller: 'posts/downvotes'
  end
end
