Rails.application.routes.draw do
  devise_for :users
  resources :stories do
    collection do
      get 'search'
    end
    resources :reviews
    resources :chats
  end
root 'stories#index'
end