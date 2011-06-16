Easybt::Application.routes.draw do

  %w(posts releases).each do |resource|
    resources resource.to_sym do
      resources :comments, :only => [:create, :edit, :update, :destroy]
    end
  end

  match 'cat/:id(/:subid)' => 'releases#browse', :as => :browse_releases
  root :to => 'posts#index'
end
