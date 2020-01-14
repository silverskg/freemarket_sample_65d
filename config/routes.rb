Rails.application.routes.draw do
  # ログインページ
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
  
  #商品ページ
  resources :items do
    #購入内容確認ページ
    resources :product_confirmation, only: :index
    post 'product_confirmation', to: 'product_confirmation#sell_item'
  end

  # ログアウトページ
  resources :logout, only: :index

  # マイページ
  resources :my_page, only: :index

  # マイページ編集ページ
  resources :edit_profile, only: :index

  # 本人情報確認ページ
  resources :information, only: :index

  # クレジットカード情報登録ページ(仮ルート)
  resources :card_register1, only: :index
  resources :card_register2, only: :index
  resources :card_register3, only: :index

  # 出品商品確認ページ
  resources :sell_items, only: [:index, :show]

  # カテゴリーページ
  resources :category, only: [:index, :show]

end
