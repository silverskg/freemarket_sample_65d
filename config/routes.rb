Rails.application.routes.draw do
 
   root to: "items#index"
  devise_for :users, controllers: {
    registrations:  'users/registrations'
  }
  devise_scope :user do
    get 'login', to: 'users/registrations#new'
    get 'step1_registrations', to: 'users/registrations#step1'
    get 'step2_registrations', to: 'users/registrations#step2'
    post 'step3_registrations', to: 'users/registrations#step3'
    post 'step4_registrations', to: 'users/registrations#step4'
    get 'step5_registrations', to: 'users/registrations#step5'
    post 'step6_registrations', to: 'users/registrations#step6'
    get 'step7_registrations', to: 'users/registrations#step7'
    get  'user_registration', to: 'users/registrations#create'
  end
end

  
  

  

