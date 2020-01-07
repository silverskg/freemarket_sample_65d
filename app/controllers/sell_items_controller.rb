class SellItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to action: 'index'
  end
end
