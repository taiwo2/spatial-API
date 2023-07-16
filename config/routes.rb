Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post '/spatial_layers', to: 'spatial_layers#create'
      get '/spatial_layers', to: 'spatial_layers#show'
      get '/spatial_layers/map', to: 'spatial_layers#map'
    end
  end
end
