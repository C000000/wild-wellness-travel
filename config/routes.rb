Rails.application.routes.draw do

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }

  root to: 'pages#home'
  get 'landing' => 'pages#landing'
  get 'about' => 'pages#about'
  get 'blog' => 'pages#blog'

  resources :properties
  get 'new_leader' => 'properties#new_leader'
  put 'create_leader' => 'properties#create_leader'
  get 'retreat_leaders' => 'properties#retreat_leaders'
  get 'leader_dashboard' => 'properties#leader_dashboard'

  resources :retreats
  resources :bookings
  resources :reviews

  mount Attachinary::Engine => "/attachinary"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
