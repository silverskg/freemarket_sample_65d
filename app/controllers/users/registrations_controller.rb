class Users::RegistrationsController < Devise::RegistrationsController
  before_action :validates_step2, only: [:step3] 
  
  def index
  end

  def step1_login
    @user = User.new
  end

  def step2_user_form
    @user = User.new # 新規インスタンス作成
  end
  
  def validates_step2
    session[:nickname] = user_params[:nickname]
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:first_name_zenkaku] = user_params[:first_name_zenkaku]
    session[:last_name_zenkaku] = user_params[:last_name_zenkaku]
    session[:first_name_kana]  = user_params[:first_name_kana]
    session[:last_name_kana] = user_params[:last_name_kana]
    session[:birthday] = params[:year] + params[:month] + params[:day]
    @user = User.new(
      nickname:             session[:nickname],
      email:                session[:email],
      password:             session[:password],
      first_name_zenkaku:   session[:first_name_zenkaku],
      last_name_zenkaku:    session[:last_name_zenkaku],
      first_name_kana:      session[:first_name_kana],
      last_name_kana:       session[:last_name_kana],
      birthday:             session[:birthday]
    )
   render :step2_user_form unless @user.valid?
  end

  def step3
    @user.build_address
  end

  def step4
    @user = User.new
    @user.build_address
  end

  def step5_address_form
    @address = Address.new
  end

  def step6_payjp
    @user = User.new
  end

  def step7_done
    @user = User.new
  end

  def create
    @user = User.new(
      nickname: session[:nickname], # sessionに保存された値をインスタンスに渡す
      email: session[:email],
      password: session[:password],
      last_name_zenkaku: session[:last_name_zenkaku], 
      first_name_zenkaku: session[:first_name_zenkaku], 
      last_name_kana: session[:last_name_kana], 
      first_name_kana: session[:first_name_kana], 
      birthday: session[:birthday],
    )

    @user.save
    session[:id] = @user.id
    
    @address = Address.new(address_params)
    if @address.valid?
      @address.save
      sign_in User.find(session[:id]) unless user_signed_in?
      redirect_to card_new_path
    else
      render :step5_address_form
    end
    
  end



  # ストロングパラメータの許可
  print
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

  def address_params
    params.require(:address).permit(
      :build_name,
      :addresses_banchi,
      :phone_number,
      :prefectures, 
      :city,
      :post_number,
      :first_name_zenkaku,
      :last_name_zenkaku,
      :first_name_kana,
      :last_name_kana
    ).merge(user_id: @user.id)
  end
  
end
