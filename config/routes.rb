Easybt::Application.routes.draw do
  devise_for :users

  %w(posts releases).each do |resource|
    resources resource.to_sym do
      resources :comments
    end
  end

  root :to => "pages#index"

  match 'cat/:id(/:subid)' => 'releases#browse'
  match "/uploads/torrents/get/*path" => "gridfs#serve"
end