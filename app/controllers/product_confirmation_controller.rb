class ProductConfirmationController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: :index
  before_action :set_user, only: :index

  def index
  end

  def set_item
    @item = Item.find(params[:item_id])
    @image = Image.find_by(item_id: @item.id)
  end

  def set_user
    @user = User.find(current_user.id)
    @address = Address.find_by(user_id: @user.id)
    @prefecture = Prefecture.find(@address.prefectures)
  end
  
end
