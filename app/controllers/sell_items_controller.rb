class SellItemsController < ApplicationController
  before_action :set_item, only: [:show, :destroy]

  def index
    @items = Item.all.includes(:images)
  end

  def show
  end

  def edit
  end

  def destroy
    if @item.destroy
      redirect_to action: 'index'
    else
      redirect_to action: 'index'
    end
  end

  private
  def set_item
    @item = Item.find(params[:id])
  end

end
