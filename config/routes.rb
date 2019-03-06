Rails.application.routes.draw do
  devise_for :users
  resources :bikes do
    resources :bookings, only: [:create]
  end
  resources :bookings, only: [:edit, :update, :index, :destroy] do
    post 'validate', to: 'bookings#validate', as: :validate
  end
  root to: 'pages#home'
end
