class CategoryController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @items = @category.items.order(created_at: :desc).all.page(params[:page]).per(5)
  end
end
