Rails.application.routes.draw do

  get 'reviews/index'

  get 'reviews/show'

  get 'reviews/create'

  get 'reviews/edit'

  get 'reviews/update'

  get 'reviews/destroy'

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }

  root to: 'pages#home'
  get 'landing' => 'pages#landing'

  resources :companies, only: [:new, :create, :update]
  get 'company_dashboard' => 'companies#dashboard'

  resources :retreats
  resources :bookings
  resources :reviews

  mount Attachinary::Engine => "/attachinary"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
