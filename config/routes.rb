Rails.application.routes.draw do
  root to: "users#new"
  resources :beers do
    member do
      post "add_user"
      post "remove_user"
    end
    resources :reviews
  end
  resources :users
  resource :session
end
