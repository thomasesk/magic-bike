Rails.application.routes.draw do
  devise_for :users
  resources :bikes do
    resources :bookings, only: [:create]
  end
  resources :bookings, only: [:edit, :update, :index]
  root to: 'pages#home'
end
