class CategoryController < ApplicationController
  def index
    @categories = Category.all
  end

  def search
    @category = Category.find(params[:id])
  end
end
