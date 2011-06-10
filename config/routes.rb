Easybt::Application.routes.draw do
  resources :releases

  resources :posts

  root :to => 'posts#index'
end
