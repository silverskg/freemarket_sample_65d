class SellItemsController < ApplicationController
  before_action :set_item, only: [:show, :destroy]

  def index
    @items = Item.includes(:images)
  end

  def show
  end

  def edit
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
