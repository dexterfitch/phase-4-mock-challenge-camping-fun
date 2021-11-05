Rails.application.routes.draw do
  resources :signups, only: :create
  resources :activities, only: [:index, :destroy]
  resources :campers, except: [:update, :destroy]
end
