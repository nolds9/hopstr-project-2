Rails.application.routes.draw do
  root to: "users#welcome"
  resources :beers do
    member do
      # NHO: little confused why these are namespaced under beers?
      post "add_user" # NHO: looks like a more semantic name for this route / functionality is add_pub  ?
      post "remove_user" # NHO: shouldn't this be a delete request? / is this route being used?
    end
    resources :reviews # NHO: recommend limiting which routes are exposed for a resource...
    # for example, don't think you are using reviews#index
  end
  resources :users
  resource :session
end
