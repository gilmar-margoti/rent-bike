Rails.application.routes.draw do
  devise_for :users

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  root to: 'bikes#index'
  resources :bikes do
    resources :bookings, except: [:index, :show]
  end
  resources :bookings, only: [:index, :show]
end
