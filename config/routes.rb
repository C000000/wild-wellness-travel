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
  resources :retreat_leaders
  resources :retreats
  resources :bookings
  resources :reviews

  # Admin
  get 'property_list' => 'site_admin#property_list'
  get 'leader_list' => 'site_admin#leader_list'
  get 'retreat_list' => 'site_admin#retreat_list'

  mount Attachinary::Engine => "/attachinary"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
