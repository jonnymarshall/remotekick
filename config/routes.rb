Rails.application.routes.draw do
  get 'reviews/create'
  devise_for :users
  root to: 'pages#home'
  resources :coffee_shops, only: [:index, :show, :new, :create] do
    resources :reviews, only: [:index, :create, :new]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
