Rails.application.routes.draw do
  root 'api/v1/users#index'
    namespace :api, defaults: { format: :json } do
      namespace :v1 do
        resources :users
        resources :tokens, only: [:create]
        resources :stickers, only: [:index, :show]
      end
    end
end