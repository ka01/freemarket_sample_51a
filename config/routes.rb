Rails.application.routes.draw do
  devise_for :users,  controllers: {
    registrations: 'users/registrations' ,
    omniauth_callbacks: 'users/omniauth_callbacks'
    }
  root 'items#index'
  resources :mypage do
    collection do
      get "notification"
      get "todo"
      get "purchase"
      get "purchased"
      get "profile"
      patch "profile_update"
      get "logout"
      get "card"
      get "identification"
      patch "identification_update"
      get "like"
      resources :listings do
        collection do
          get "listing"
          get "in_progress"
          get "completed"
        end
      end
    end
  end
  resources :items do
    collection do
      get  'confirmation/:id'=>  'purchases#confirmation', as: 'confirmation'
      post 'pay/:id'=>   'purchases#pay', as: 'pay'
      get  'done'=>      'purchases#done', as: 'done'
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_size_children', defaults: { format: 'json' }
      get 'search'
      get 'change_trading_status/:id', to: 'items#change_trading_status', as: :change_trading_status
    end
  end
  resources :signup do
    collection do
      get 'reset'
      get 'step1' # 1ページ目 (メールアドレスで登録する、ファイスブックで登録する、グーグルで登録する。)
      get 'step2' # 会員情報登録画面
      get 'step3' # 電話番号の確認画面
      get 'step4' # 電話番号認証画面（snsで届いた認証番号を登録）
      get 'step5' # 発送元、お届け先住所入力画面
      get 'step6' # 支払い方法入力画面
      get 'step7' # 登録完了画面
    end
  end
  resources :category, only: [:index, :show]
  get '/item_images/destroy', to: 'item_images#destroy'
  resources :brand, only: [:index, :show] do
    resources :brand_category, only: [:show]
  end
  get 'likes/:item_id/create', to: 'likes#create'
  get 'likes/:item_id/destroy', to: 'likes#destroy'
  resources :brand_groups, only: [:index, :show]
end
