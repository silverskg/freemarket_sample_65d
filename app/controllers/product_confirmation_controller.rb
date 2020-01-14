class ProductConfirmationController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: :index

  def index
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
