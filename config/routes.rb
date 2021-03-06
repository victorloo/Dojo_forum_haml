Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts do
    resources :comments, only: [:create, :edit, :update, :destroy]
    collection do
      get :feeds
    end
    member do
      post :collect
      post :discollect
      get :draft_edit
    end
    
  end
  root 'posts#index'
  resources :categories, only: :show

  resources :users, only: [:show, :edit, :update] do
    member do
      get :comments
      get :collections
      get :drafts
      get :friends
    end
  end

  resources :applyings, only: :create do
    member do
      post :confirm
      post :ignore
    end
  end

  namespace :admin do
    resources :users, only: [:index, :edit, :update]
    resources :categories, except: [:show, :new, :edit]
    root 'categories#index'
  end

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      post '/login' => 'auth#login'
      post '/logout' => 'auth#logout'

      resources :posts, only: [:index, :show, :create, :update, :destroy]
    end
  end
end