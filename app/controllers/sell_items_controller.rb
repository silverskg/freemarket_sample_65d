class SellItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:show]
  before_action :check_user, only: [:show]

  def index

    # user_idは仮設定

    @items = Item.where(user_id: current_user.id).includes(:images)
  end


  private
  def set_item
    @item = Item.find(params[:id])
    @user = User.find(@item.user_id)
    @category = Category.find(@item.category_id)
    @brand = Brand.find(@item.brand_id)
    @prefecture = Prefecture.find(@item.region)
    @brand_items = Item.where(brand_id: @item.brand_id)
    @user_items = Item.where(user_id: @item.user_id)
    @images = Image.where(item_id:  @item.id)
  end

  def check_user
    if current_user != @user
      redirect_to root_path
    end
  end

end
