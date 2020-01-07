class SellItemsController < ApplicationController
  def index
    @items = Item.all
  end
end
