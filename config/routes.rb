Rails.application.routes.draw do

  # resources :users
  # resources :devices

  namespace :api do
    post '/events/start', to: 'events#create', format: false, defaults: { format: :json, type: 'start' }
    post '/events/end',   to: 'events#create', format: false, defaults: { format: :json, type: 'end' }
  end
end
