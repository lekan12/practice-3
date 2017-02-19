Rails.application.routes.draw do
  devise_for :users
  resources :stories do
    resources :reviews
    resources :chats
  end
root 'stories#index'
end