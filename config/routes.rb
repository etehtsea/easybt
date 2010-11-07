Easybt::Application.routes.draw do |map|
  devise_for :users

  resources :posts
  resources :releases

  root :to => "pages#index"

  match 'cat/:id(/:subid)' => 'releases#browse'
  match "/uploads/torrents/get/*path" => "gridfs#serve"
end