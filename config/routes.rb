Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :mypage do
    collection do
      get "notification"
      get "todo"
      get "purchase"
      get "purchased"
      get "profile"
      get "logout"
      get "card"
      post "sell"
    end
  end
  resources :items
end
