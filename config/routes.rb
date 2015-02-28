Rails.application.routes.draw do

  # resources :users
  # resources :devices

  namespace :api do
    resources :events
  end
end
