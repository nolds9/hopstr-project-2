Rails.application.routes.draw do
  root to: "users#new"
  resources :users
  resources :beers
end
