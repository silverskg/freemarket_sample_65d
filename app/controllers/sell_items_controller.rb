class SellItemsController < ApplicationController
  before_action :set_item, only: [:show, :destroy]

  def index
    # user_idは仮設定
    @items = Item.where(user_id: current_user.id).includes(:images)
  end

  def destroy
    if @item.destroy
      redirect_to action: 'index'
    else
      render 'layouts/notifications'
      redirect_to action: 'show'
    end
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
end
