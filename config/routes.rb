Rails.application.routes.draw do
  # DEVELOPMENT
  resources :devpages, only: :show
  # devise_for :users
  devise_for :users, controllers: { sessions: 'users/sessions' }
  
  get 'venues/new/venue_search', to: 'venues#venue_search'
  get '/location_search', to: 'pages#home'

  
  root to: 'pages#home'
  resources :venues, only: [:index, :show, :new, :create] do
    resources :reviews, only: [:index, :create, :new, :edit, :update]
    get 'venue_search', on: :new
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end