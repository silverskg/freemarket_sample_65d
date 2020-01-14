class Users::RegistrationsController < Devise::RegistrationsController
  before_action :validates_step2, only: [:step3]
  before_action :validates_step5, only: [:step6_payjp] 
  
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
    # binding.pry
   render :step2_user_form unless @user.valid?
    @user.build_address
  end

  def step3
  end

  def step4
    @user = User.new
    @user.build_address
  end

  def step5_address_form
    @address = Address.new
  end

  def validates_step5
    session[:first_name_zenkaku] = address_params[:first_name_zenkaku]
    session[:last_name_zenkaku] = address_params[:last_name_zenkaku]
    session[:first_name_kana]  = address_params[:first_name_kana]
    session[:last_name_kana] = address_params[:last_name_kana]
    session[:post_number] = address_params[:post_number]
    session[:prefectures] = address_params[:prefectures]
    session[:city]  = address_params[:city]
    session[:addresses_banchi] = address_params[:addresses_banchi]
    session[:build_name]  = address_params[:build_name]
    session[:phone_number] = address_params[:phone_number]
    @address = Address.new(
      first_name_zenkaku:          session[:first_name_zenkaku],
      last_name_zenkaku:           session[:last_name_zenkaku],
      first_name_kana:             session[:first_name_kana],
      last_name_kana:              session[:last_name_kana],
      post_number:                 session[:post_number],
      prefectures:                 session[:prefectures],
      city:                        session[:city],
      addresses_banchi:            session[:addresses_banchi],
      build_name:                  session[:build_name],
      phone_number:                session[:phone_number]
    )
    render :step5_address_form unless @address.valid?
  end

  def step6_payjp
    @user = User.new
    @user.build_address
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
      @address = Address.create(
       first_name_zenkaku:          session[:first_name_zenkaku],
       last_name_zenkaku:           session[:last_name_zenkaku],
       first_name_kana:             session[:first_name_kana],
       last_name_kana:              session[:last_name_kana],
       build_name:        session[:build_name],
       addresses_banchi:  session[:addresses_banchi],
       phone_number:      session[:phone_number],
       prefectures:       session[:prefectures],
       city:              session[:city],
       post_number:       session[:post_number],
       user_id:           session[:id]
      )

       session[:id] = @user.id
       sign_in User.find(session[:id]) unless user_signed_in?
      redirect_to  card_new_path
    
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
    )
  end
  
end
