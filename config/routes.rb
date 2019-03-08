Rails.application.routes.draw do
  devise_for :users
  resources :bikes do
    resources :bookings, only: [:create]
  end
  resources :bookings, only: [:edit, :update, :index, :destroy, :show] do
    resources :messages, only: :create
    post 'validate', to: 'bookings#validate', as: :validate
  end
  root to: 'pages#home'
end
