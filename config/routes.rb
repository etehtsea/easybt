Easybt::Application.routes.draw do
  resources :releases
  resources :posts

  match 'cat/:id(/:subid)' => 'releases#browse', :as => :browse_releases
  root :to => 'posts#index'
end
