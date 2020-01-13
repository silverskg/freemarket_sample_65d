Rails.application.routes.draw do
 
   root to: "items#index"
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
end

  
  

  

