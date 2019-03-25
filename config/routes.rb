Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
    post 'login', to: 'devise/sessions#create'
    get 'logout', to: 'devise/sessions#destroy'
    get 'sign_up', to: 'devise/registrations#new'
    get 'sign_up/edit', to: 'devise/registrations#edit'
  end
  resources :users, only: [:show]
  resources :posts, only: [:create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
