Rails.application.routes.draw do
 
   root to: "items#index"
  devise_for :users, controllers: {
    registrations:  'users/registrations',
    # :sessions => 'users/sessions'
  }
  devise_scope :user do
    # resources  :registrations, only: [:create] do
    get 'login', to: 'users/registrations#new'
    get 'step1_registrations', to: 'users/registrations#step1'
    get 'step2_registrations', to: 'users/registrations#step2'
    # post 'step2_registrations', to: 'users/registrations#step2'
    post 'step3_registrations', to: 'users/registrations#step3'
    post 'step4_registrations', to: 'users/registrations#step4'
    get 'step5_registrations', to: 'users/registrations#step5'
    post 'step6_registrations', to: 'users/registrations#step6'
    get 'step7_registrations', to: 'users/registrations#step7'
    get  'user_registration', to: 'users/registrations#create'
    # get 'step5'
    # get 'done'
  end
end

  
  

  # ログイン画面表示
  # root to: "login#index"

  # ユーザー新規登録ページ表示
  
  # root to: "registration#index_1"
  # root to: "registration#index_2"
  # root to: "registration#index_3"
  # root to: "registration#index_4"
  # root to: "registration#index_5"
  # root to: "registration#index_6"


