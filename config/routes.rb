Rails.application.routes.draw do
  devise_for :users

  #トップページ
  root to: "items#index"
  resources :items, only: [:index, :new, :create]

  # ログイン画面表示
  # root to: "login#index"

  # ログアウト画面
  # root to: "logout#index"

  # ユーザー新規登録ページ表示
  # root to: "registration#index_0"
  # root to: "registration#index_1"
  # root to: "registration#index_2"
  # root to: "registration#index_3"
  # root to: "registration#index_4"
  # root to: "registration#index_5"
  # root to: "registration#index_6"


  # ユーザーマイページ編集画面(マイページ完成次第ルーティング編集)
  # root to: "edit_profile#index"

  # 商品詳細ページ
  # root to: "items#productDetails" 

  # 本人情報確認ページ
  # root to: "information#index" 

  # クレジットカード情報登録ページ
  # root to: "card_register#index"
  # root to: "card_register#index2"
  # root to: "card_register#index3"

  # マイページ
  # root to: "my_page#index"

  #購入内容確認ページ
  #root to: "items#productConfirmation"

end
