Rails.application.routes.draw do
  post "/graphql", to: "graphql#execute"
  use_doorkeeper
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  mount_devise_token_auth_for 'User', at: 'auth'
  namespace :api do
    namespace :v1 do
      resources :earthquakes, only: [:index, :show, :create, :update, :destroy]
    end
  end

  use_doorkeeper
end
