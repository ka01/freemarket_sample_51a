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
    end
  end
end
