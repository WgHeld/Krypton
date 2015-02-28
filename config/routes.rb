Rails.application.routes.draw do

  # resources :users
  # resources :devices

  namespace :api do
    post '/events/start', to: 'events#create_start', format: false, defaults: { format: :json }
    post '/events/end',   to: 'events#create_end', format: false, defaults: { format: :json }
  end
end
