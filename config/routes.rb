require 'sidekiq/web'

Rails.application.routes.draw do
  root 'home#index'

  get '/search',to: 'home#search'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  mount Sidekiq::Web => '/sidekiq'
end
