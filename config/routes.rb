Rails.application.routes.draw do
  namespace :api, defaults: {format: :json} do
  resources :addresses
end
end
