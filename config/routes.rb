Rails.application.routes.draw do

  # Devise 
  devise_for :users, controllers: { registrations: 'users/registrations', omniauth_callbacks: 'users/omniauth_callbacks' }
  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
    post 'login', to: 'devise/sessions#create'
    get 'logout', to: 'devise/sessions#destroy'
    get 'sign_up', to: 'users/registrations#new'
    get 'sign_up/edit', to: 'users/registrations#edit'
  end

  # Static pages
  root 'pages#home'
  get  '/help',    to: 'pages#help'
  get  '/about',   to: 'pages#about'
  get  '/contact', to: 'pages#contact'


  # REST routes
  resources :users, only: [:show] do
    resources :posts, only: [:create, :destroy], shallow: true do
      resources :comments, only: [:create, :destroy], shallow: true
    end
  end
  resources :friendships, only: [:create, :destroy, :update]
  post '/posts/:id/like', to: 'posts#like', as: "like"
  get '/search', to: 'users#search'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
