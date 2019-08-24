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
      get "logout"
      get "card"
      get "identification"
    end
  end
  resources :signup do
    collection do
      get 'step1' # 1ページ目 (メールアドレスで登録する、ファイスブックで登録する、グーグルで登録する。)
      get 'step2' # 会員情報登録画面
      get 'step3' # 電話番号の確認画面
      get 'step4' # 電話番号認証画面（snsで届いた認証番号を登録）
      get 'step5' # 発送元、お届け先住所入力画面
      get 'step6' # 支払い方法入力画面
      get 'step7' # 登録完了画面
    end
  end
end
