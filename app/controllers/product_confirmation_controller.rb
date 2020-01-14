class ProductConfirmationController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :sell_item]
  before_action :set_user, only: :index
  before_action :check_user, only: :sell_item
  before_action :check_item, only: :sell_item

  def index
  end

  def sell_item
    @item.sale_status = "sold_out"
    @item.save
    redirect_to root_path
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

  def check_user
    if @item.user_id == current_user.id
      redirect_to root_path
    end
  end

  def check_item
    if @item.sale_status == "sold_out"
      redirect_to root_path
    end
  end
end
