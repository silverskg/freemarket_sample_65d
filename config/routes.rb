Rails.application.routes.draw do
  get 'card/new'
  get 'card/show'
  devise_for :users

  resources :card, only: [:new, :show] do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end

  #トップページ
  root to: "items#index"
  resources :items, only: [:index, :new, :create, :show]

  #トップページ以外は仮のルーティング設定
  # ログイン画面表示
  resources :login, only: :index

  # ログアウト画面
  resources :logout, only: :index

  # ユーザー新規登録ページ表示
  resources :registration0, only: :index
  resources :registration1, only: :index
  resources :registration2, only: :index
  resources :registration3, only: :index
  resources :registration4, only: :index
  resources :registration5, only: :index
  resources :registration6, only: :index

  # 商品詳細ページ
  resources :product_details, only: :index

  #購入内容確認ページ
  resources :product_confirmation, only: :index

  # マイページ
  resources :my_page, only: :index

  # ユーザーマイページ編集画面
  resources :edit_profile, only: :index

  # 本人情報確認ページ
  resources :information, only: :index

  # クレジットカード情報登録ページ
  resources :card_register1, only: :index
  resources :card_register2, only: :index
  resources :card_register3, only: :index

end
