Rails.application.routes.draw do
  # DEVELOPMENT
  get 'development/development_bulma', to: 'development#development_bulma'
  get 'development/development_home', to: 'development#development_home'
  get 'development/development_index', to: 'development#development_index'
  get 'development/development_show', to: 'development#development_show'

  get 'coffee_shops/new/venue_search', to: 'coffee_shops#venue_search'
  get 'coffee_shops/autocomplete_response', to: 'coffee_shops#autocomplete_response'

  devise_for :users
  root to: 'pages#home'
  resources :coffee_shops, only: [:index, :show, :new, :create] do
    resources :reviews, only: [:index, :create, :new]
    get 'venue_search', on: :new
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end