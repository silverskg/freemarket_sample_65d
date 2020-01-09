class SellItemsController < ApplicationController
  before_action :set_item, only: [:show, :destroy]

  def index
    # user_idは仮設定
    @items = Item.where(user_id: 1).includes(:images)
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
  end
end
