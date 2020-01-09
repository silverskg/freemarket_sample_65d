# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :validates_step2, only: :step3
  before_action :validates_step5, only: :step6 
  # before_action :configure_sign_up_params, only: [:new]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  
  # 許可するキーを設定します
  

  def index
  end


  def step1
    @user = User.new
  end

  def step2
    @user = User.new # 新規インスタンス作成
  end
  
  def validates_step2
    session[:user_params] = user_params
    @user = User.new(session[:user_params])
    # session[:nickname] = user_params[:nickname]
    # session[:email] = user_params[:email]
    # session[:password] = user_params[:password]
    # session[:first_name_zenkaku] = user_params[:first_name_zenkaku]
    # session[:last_name_zenkaku] = user_params[:last_name_zenkaku]
    # session[:first_name_kana]  = user_params[:first_name_kana]
    # session[:last_name_kana] = user_params[:last_name_kana]
    # session[:birthday] = birthday_params[:year] + birthday_params[:month] + birthday_params[:day]
    # @user = User.new(
    #   nickname:             session[:nickname],
    #   email:                session[:email],
    #   password:             session[:password],
    #   first_name_zenkaku:   session[:first_name_zenkaku],
    #   last_name_zenkaku:    session[:last_name_zenkaku],
    #   first_name_kana:      session[:first_name_kana],
    #   last_name_kana:       session[:last_name_kana],
    #   birthday:             session[:birthday]
    # )
    binding.pry
   render :step1 unless @user.valid?
    @user.build_address
  end

  def step3
    @user = User.new
    @user.build_address
  end

  def step4
    @user = User.new
    @user.build_address
  end

  def step5
    @user = User.new
    @user.build_address
  end

  def validates_step5
    @user = User.new(session[:user_params])
    session[:first_name_zenkaku] = user_params[:first_name_zenkaku]
    session[:last_name_zenkaku] = user_params[:last_name_zernkaku]
    session[:first_name_kana]  = user_params[:first_name_kana]
    session[:last_name_kana] = user_params[:last_name_kana]
    session[:post_number] = user_params[:address_attributes][:post_number]
    session[:prefectures] = user_params[:address_attributes][:prefectures]
    session[:city]  = user_params[:address_attributes][:city]
    session[:addresses_banchi] = user_params[:address_attributes][:addresses_banchi]
    session[:build_name]  = user_params[:address_attributes][:build_name]
    session[:phone_number] = user_params[:address_attributes][:phone_number]
    @user = User.new(
      first_name_zenkaku:         session[:first_name_zenkaku],
      last_name_zenkaku:          session[:last_name_zenkaku],
      first_name_kana:            session[:first_name_kana],
      last_name_kana:             session[:last_name_kana],
    )
    @address = Address.new(
      post_number:                 session[:post_number],
      prefectures:                 session[:prefectures],
      city:                        session[:city],
      addresses_banchi:            session[:addresses_banchi],
      build_name:                  session[:build_name],
      phone_number:                session[:phone_number]
    )
    binding.pry
    render :step1 unless @user.valid? && @address.valid?
    @user = User.new
    @user.build_address
  end

  def step6
    @user = User.new
    @user.build_address
  end

  def step7
    @user = User.new
  end


  def create
    binding.pry
    @user = User.new(
      nickname: session[:nickname], # sessionに保存された値をインスタンスに渡す
      email: session[:email],
      password: session[:password],
      # password_confirmation: session[:password_confirmation],
      last_name_zernkaku: session[:last_name_zernkaku], 
      first_name_zenkaku: session[:first_name_zenkaku], 
      last_name_kana: session[:last_name_kana], 
      first_name_kana: session[:first_name_kana], 
      birthday: session[:birthday],
    )

    if @user.save
      # ログインするための情報を保管
      session[:id] = @user.id
      @address = Address.create(
       build_name:        session[:build_name],
       addresses_banchi:  session[:addresses_banchi],
       phone_number:      session[:phone_number],
       prefectures:       session[:prefectures],
       city:              session[:city],
       post_number:       session[:post_number],
       user_id:           session[:id]
      )
      redirect_to  step7_registrations_path
    else
      render  :step1
    end
  end



  # ストロングパラメータの許可
  private
  def user_params
    params.require(:user).permit(
      :nickname, 
      :email, 
      :password,
      :last_name_zenkaku, 
      :first_name_zenkaku, 
      :last_name_kana, 
      :first_name_kana, 
      :birthday,   
      address_attributes: [ :post_number, :prefectures, :city, :addresses_banchi, :build_name, :phone_number ])
  end

  def birthday_params
    params.permit(:year, :month, :day)
  end

  # def address_params
  #   params.permit(
  #     :build_name,
  #     :address_banchi,
  #     :phone_number,
  #     :prefectures, 
  #     :city,
  #     :post_number,
  #   )
  # end

  # POST /resource
  # def create
  #   @user = User.new(sign_up_params)
  #   unless @user.valid?
  #     flash.now[:alert] = @user.errors.full_messages
  #     render :new and return
  #   end
  #   session["devise.regist_data"] = {user: @user.attribute}
  #   session["devise.regist_data"][:user]["password"] = params[:user][:passwrod]
  #   @address = @user.build_address
  #   render :new_address
  # end

  protected

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  end
  
end
