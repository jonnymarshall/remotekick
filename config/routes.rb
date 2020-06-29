Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # DEVELOPMENT
  resources :devpages, only: :show
  
  devise_for :users, controllers: {
    # sessions: 'users/sessions',
    confirmations: 'users/confirmations',
    # registrations: 'users/registrations'
  }
  
  get 'venues/new/venue_search', to: 'venues#venue_search'
  get '/location_search', to: 'pages#home'

  
  root to: 'pages#home'
  resources :venues do
    resources :reviews, only: [:index, :create, :new, :edit, :update, :destroy]
    get 'venue_search', on: :new
  end

  resources :cities, only: :index
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end