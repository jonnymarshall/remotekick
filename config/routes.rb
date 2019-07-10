Rails.application.routes.draw do
  get 'coffee_shops/new/venue_search', to: 'coffee_shops#venue_search'
  devise_for :users
  root to: 'pages#home'
  resources :coffee_shops, only: [:index, :show, :new, :create] do
    resources :reviews, only: [:index, :create, :new]
    get 'venue_search', on: :new
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
