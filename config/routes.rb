Rails.application.routes.draw do
  # DEVELOPMENT
  resources :devpages, only: :show
  
  get 'venues/new/venue_search', to: 'venues#venue_search'
  get 'venues/autocomplete_response', to: 'venues#autocomplete_response'

  devise_for :users
  root to: 'pages#home'
  resources :venues, only: [:index, :show, :new, :create] do
    resources :reviews, only: [:index, :create, :new]
    get 'venue_search', on: :new
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end