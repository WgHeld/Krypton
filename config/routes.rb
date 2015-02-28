Rails.application.routes.draw do

  root 'client#index'

  get '/client/users', to: 'client#users'

  # resources :users
  # resources :devices

  namespace :api do
    post 'events/start', to: 'events#create_start', format: false, defaults: { format: :json }
    post 'events/end',   to: 'events#create_end', format: false, defaults: { format: :json }
  end
end
