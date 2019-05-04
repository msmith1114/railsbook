Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
    post 'login', to: 'devise/sessions#create'
    get 'logout', to: 'devise/sessions#destroy'
    get 'sign_up', to: 'devise/registrations#new'
    get 'sign_up/edit', to: 'devise/registrations#edit'
  end
  root 'pages#home'
  get  '/help',    to: 'pages#help'
  get  '/about',   to: 'pages#about'
  get  '/contact', to: 'pages#contact'
  resources :users, only: [:show]
  resources :posts, only: [:create]
  resources :friendships
  post '/users/:id/like', to: 'posts#like', as: :like 
  get '/search', to: 'users#search'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
