Rails.application.routes.draw do
  # ログイン画面表示
  devise_for :users, controllers: {
    registrations:  'users/registrations'
  }
  devise_scope :user do
    get 'login', to: 'users/registrations#new'
    get 'step1_login_registrations', to: 'users/registrations#step1_login'
    get 'step2_user_form_registrations', to: 'users/registrations#step2_user_form'
    post 'step3_registrations', to: 'users/registrations#step3'
    post 'step4_registrations', to: 'users/registrations#step4'
    post 'step5_address_form_registrations', to: 'users/registrations#step5_address_form'
    post 'step6_payjp_registrations', to: 'users/registrations#step6_payjp'
    get 'step7_registrations', to: 'users/registrations#step7'
    get  'user_registration', to: 'users/registrations#create'
  end

  #トップページ
  root to: "items#index"
  
  #商品登録画面
  resources :items, only: [:index, :new, :create, :edit, :update, :show]

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


  #フッターメニューバー
  resources :footermenu, only: :index


  # 出品商品確認ページ
  resources :sell_items, only: [:index, :show, :destroy]

  # カテゴリー
  resources :category, only: [:index, :show]

end
