Easybt::Application.routes.draw do |map|
  devise_for :users

  resources :posts
  resources :releases

  match 'about' => 'home#about'
  get "home/index"

  root :to => "home#index"

  match 'cat/:id(/:subid)' => 'releases#browse'
  match "/uploads/torrents/get/*path" => "gridfs#serve"  
end